#!/bin/bash
cd /home/ubuntu/
touch /home/ubuntu/myscript.sh
# Guardar texto en el archivo.
echo "\
apt-get update -y
apt-get upgrade -y
apt-get install jq -y 

# Clona el repositorio
git clone https://github.com/bcarranza/webappdemo.git
cd webappdemo/client

echo "REACT_APP_BACKEND_URL=http://'${lb_dns}':3000" > .env


# Instala el paquete apache2
apt install apache2 -y

ufw allow 'Apache'


# Inicia y habilita el servicio apache2
systemctl start apache2.service
systemctl enable apache2.service

# Instalar Node.js y npm
sudo apt-get install -y nodejs npm

# Verificar la instalación
node -v
npm -v

# Compilar el frontend.
npm install && npm run build


cp -r /home/ubuntu/webappdemo/client/build/* /var/www/html/
" > /home/ubuntu/myscript.sh

chmod u+x /home/ubuntu/myscript.sh

. /home/ubuntu/myscript.sh


