# name: Atualizar easy_toolbox
# description: Atualiza o sistema easy_toolbox para a versão mais recente. Afim de evitar problemas, os dados são guardados na pasta .backups antes de atualizar.
source ../init_env.nu ;

log info "Iniciando o processo de atualização do easy_toolbox." ;
source ../backup.nu ;
git pull
