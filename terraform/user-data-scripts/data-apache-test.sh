#!/bin/bash

# Actualizar paquetes
apt-get update -y
apt-get upgrade -y

# Instalar el paquete apache2
apt install apache2 -y

ufw allow 'Apache'

# Iniciar y habilitar el servicio apache2
systemctl start apache2.service
systemctl enable apache2.service


# Crear un archivo index.html con el mensaje "Hello World"
echo "Hello World from $(hostname -f)" > /var/www/html/index.html