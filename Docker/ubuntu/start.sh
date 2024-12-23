#!/bin/bash

# carga las variables d entorno
set -e

echo "COnfigura mis Servidorr " >> /root/datos/archivo.log
echo "${USUARIO}es el usuario " >> /root/datos/archivo.log
echo "${PROCESO}es el proceso " >> /root/datos/archivo.log

#buscaqueda de fichero
if grep -q "${USUARIO}" "/etc/passwd"; then
    echo "${USUARIO} se encuentra en el sistemaa" >> /root/datos/archivo.log
else
    echo "${USUARIO} no se encuentra en el sistema " >> /root/datos/archivo.log
fi

tail -f /dev/null