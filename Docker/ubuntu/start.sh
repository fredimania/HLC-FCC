#!/bin/bash

# Carga las variables de entorno
set -e

echo "Configura mis Servidor" > /root/logs/archivo.log
echo "${USUARIO} es el usuario " >> /root/logs/archivo.log

# Función para verificar si el usuario existe
check_usuario(){
    if grep -q "^${USUARIO}:" /etc/passwd; then
        echo "${USUARIO} se encuentra en el sistema" >> /root/logs/archivo.log
        return 1
    else
        echo "${USUARIO} no se encuentra en el sistema" >> /root/logs/archivo.log
        return 0
    fi
}

# Función para verificar si el directorio home existe
check_home () {
    if [ ! -d "/home/${USUARIO}" ]; then
        echo "El directorio de ${USUARIO} NO existe" >> /root/logs/archivo.log
        return 0
    else
        echo "El directorio de ${USUARIO} existe" >> /root/logs/archivo.log
        return 1
    fi
}

# Función para crear el usuario si no existe
newUser(){
    check_usuario
    if [ "$?" -eq 0 ]; then
        check_home
        if [ "$?" -eq 0 ]; then
            useradd -m -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}"
            echo "${USUARIO}:${PASSWORD}" | chpasswd
            echo "El usuario ${USUARIO} ha sido creado" >> /root/logs/archivo.log
        else
            echo "El usuario ${USUARIO} NO PUEDE CREARSE, existe home" >> /root/logs/archivo.log
        fi
    else 
        echo "El usuario ${USUARIO} NO PUEDE CREARSE, ya existe en el sistema" >> /root/logs/archivo.log
    fi
}

# Llamar a la función para crear el usuario
newUser

# Mantener el contenedor en ejecución
tail -f /dev/null
