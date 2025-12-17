source init_env.nu


def parse_command [path:string] : nothing -> record<name: string, display: string, description: string, run: closure> {
    let path_struct = $path | path parse ;


    let get_command_line_is_comment = { $in | str trim | str starts-with "#" } ;
    let command_content = open $path --raw 

    let metadata = $command_content | lines | take while $get_command_line_is_comment | each {str replace "#" ""} | str join "\n" | from yaml ;

    let display  = $"($metadata.name)\(($path_struct.stem)\): ($metadata.description)" ;

    let run = { nu $path }
    log debug $"Parsed metadata for command at ( $path ): ( $metadata )" ;

    return { ...$metadata, display: $display, run: $run } ;
}

const cmds_path = $scripts_dir | path join "commands/" ;

let available_commands = ( 
    ls $cmds_path | 
    where type == "file" | 
    get name | 
    each { 
        let path = $in;
        let command  = parse_command $path;
   
        return $command
    } ;
);
log debug $"Available commands: ( $available_commands | length )" ;
let command = $available_commands | input list -d display "Selecione um comando: "  ; 

do $command.run ;