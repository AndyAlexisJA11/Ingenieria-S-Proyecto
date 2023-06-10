#!/bin/bash
cd /home/ubuntu/
touch /home/ubuntu/myscript.sh
# Guardar texto en el archivo
echo "\
apt-get update -y
apt-get upgrade -y

# Clona el repositorio
git clone https://github.com/bcarranza/angular-realworld-example-app.git
cd /angular-realworld-example-app/

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Export NVM_DIR into the environment
export NVM_DIR=\"\$HOME/.nvm\"

# Load nvm
[ -s \"\$NVM_DIR/nvm.sh\" ] && \\. \"\$NVM_DIR/nvm.sh\"

# Install specific Node.js version with nvm
nvm install 16.14.0
nvm use 16.14.0
nvm alias default 16.13.0

# Ensure you have the correct version
node --version

# Instala el paquete apache2
apt install apache2 -y

ufw allow 'Apache'

# Inicia y habilita el servicio apache2
systemctl start apache2.service
systemctl enable apache2.service

# Instala Angular CLI globalmente
npm install -g @angular/cli@15.2.7

# Instala Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg
echo \"deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian stable main\" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install -y yarn

# Instala las dependencias del proyecto
yarn install

# Construye y sirve el proyecto en modo producciónd
echo Y | ng build --configuration production

cp -r /home/ubuntu/angular-realworld-example-app/dist/angular-conduit/* /var/www/html/
" > /home/ubuntu/myscript.sh

chmod u+x /home/ubuntu/myscript.sh

. /home/ubuntu/myscript.sh

