use std/log;

const here = path self ;
export const base_dir = $here | path dirname -n 2 ;
log debug $"Base directory set to: ( $base_dir )" ;

export const bins_dir = $base_dir | path join ".bin"  ; 

$env.PATH ++= [$bins_dir] ;

log debug $"Bins directory set to: ( $bins_dir )" ;

export const data_dir = $base_dir | path join "dados" ;
log debug $"Data directory set to: ( $data_dir )" ;

export const scripts_dir = $base_dir | path join ".scripts" ;
log debug $"Scripts directory set to: ( $scripts_dir )" ;

log debug "Environment initialized." ;