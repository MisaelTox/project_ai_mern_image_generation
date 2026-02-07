# 1. El Sistema Operativo
FROM node:18-alpine

# 2. El Taller de Trabajo
WORKDIR /app

# 3. El Inventario de Herramientas
COPY package*.json ./

# 4. La Instalación
RUN npm install

# 5. Los Planos del Proyecto
COPY . .

# 6. El Agujero en la Caja
EXPOSE 5173

# 7. El Encendido del Motor
CMD ["npm", "run", "dev", "--", "--host"]