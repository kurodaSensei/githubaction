FROM node:alpine

# Instalar Git
RUN apk add --no-cache git ruby ruby-dev ruby-etc build-base

#Instalar bundler ruby dependency
RUN gem install bundler

# Instalar Shopify CLI y Shopify Theme Check 
RUN npm install --no-package-lock --no-save @shopify/cli @shopify/theme

# Copiar el script de entrada y el archivo de Node.js al contenedor
COPY entrypoint.sh /entrypoint.sh
COPY runThemeCheck.js /runThemeCheck.js

# Hacer que el script de entrada sea ejecutable
RUN chmod +x /entrypoint.sh

# Establecer el script de entrada como el punto de entrada del contenedor
ENTRYPOINT ["/entrypoint.sh"]
