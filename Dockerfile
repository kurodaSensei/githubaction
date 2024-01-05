FROM node:alpine

# Instalar Git
RUN apk add --no-cache git 
# Instalar Shopify CLI y Shopify Theme Check globalmente

# Copiar el script de entrada y el archivo de Node.js al contenedor
COPY entrypoint.sh /entrypoint.sh
COPY runThemeCheck.js /runThemeCheck.js

# Hacer que el script de entrada sea ejecutable
RUN chmod +x /entrypoint.sh

# Establecer el script de entrada como el punto de entrada del contenedor
ENTRYPOINT ["/entrypoint.sh"]
