# 1. Usamos una imagen de Node.js ligera (Alpine es la más pequeña)
FROM node:18-alpine

# 2. Creamos y entramos a la carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiamos los archivos de dependencias primero (para optimizar caché)
COPY package*.json ./

# 4. Instalamos las dependencias
RUN npm install

# 5. Copiamos el resto del código del servidor
COPY . .

# 6. Exponemos el puerto que usa el servidor (normalmente el 8080)
EXPOSE 8080

# 7. Comando para arrancar la aplicación
CMD ["npm", "start"]