#!/bin/bash

# Actualiza los paquetes del sistema
sudo apt-get update -y

# Instala Node.js y npm
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instala Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Instala PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Configura la contraseña del usuario 'postgres' y crea la base de datos
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
sudo -u postgres createdb realworld

# Clona el repositorio
git clone https://github.com/gothinkster/api-realworld.git
cd api-realworld

# Instala las dependencias del proyecto
yarn install

# Formatea el esquema de Prisma
yarn prisma:format

# Migrar el esquema SQL
yarn prisma migrate dev --name initial_migration

# Actualiza el cliente de Prisma
yarn prisma:generate

# Configura el archivo .env
echo "DATABASE_URL=\"postgresql://postgres:postgres@localhost:5432/realworld\"" > .env

# Sembrar la base de datos
yarn prisma:seed

# Inicia la aplicación
yarn start
