# name: Servir dados
# description: Inicia um servidor HTTP para servir arquivos de uma pasta especificada.
source ../init_env.nu ;

let path_to_serve_input =  input "Entre o caminho da pasta a ser servida: (Padrão é a pasta dados/): " ;
let path_to_serve = if $path_to_serve_input == "" { $data_dir } else { $path_to_serve_input } ;

let port_input = input "Entre a porta a ser usada (Padrão é 8080): " ;
let port = if $port_input == "" { 8080 } else { $port_input | into int } ;

log info $"Servindo a pasta ( $path_to_serve ) na porta ( $port )" ;
miniserve $path_to_serve --port $port --qrcode;
