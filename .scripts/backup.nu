source init_env.nu ;
let backups_dir = $base_dir | path join ".backups" ;
mkdir ($backups_dir)

let timestamp = (date now | format date "%Y%m%d_%H%M%S") ;
let current_backups_dir = $backups_dir | path join $timestamp ;

mkdir $current_backups_dir;

let data_backup_path = $current_backups_dir | path join "dados.zip" ;
log info $"Fazendo backup dos dados em ( $data_backup_path )" ;
7z a $data_backup_path $data_dir ;