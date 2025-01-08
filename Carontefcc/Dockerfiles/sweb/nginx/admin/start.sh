#!/bin/bash
set -e

#config_nginx(){
 #  nginx &
#}
#....
#load_entrypoint_base(){
   #ejecutar entrypoint ubbase
  # /root/admin/start.sh
  
#}

main(){
   bash /root/admin/start.sh
   
   nginx
   tail -f /dev/null 
    
}

main