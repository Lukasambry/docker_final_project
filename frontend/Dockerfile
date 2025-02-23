# Stage 1 : Construction de l'application Vue.js
FROM node:18-alpine AS builder
WORKDIR /usr/src/app

# Copier les fichiers de dépendances et installer les packages
COPY package*.json ./
RUN npm install

# Copier l'ensemble du code source
COPY . .

# Générer les fichiers de production (les fichiers seront placés par défaut dans le dossier 'dist')
RUN npm run build

# Stage 2 : Image finale avec Nginx
FROM nginx:stable-alpine AS production

# Copier les fichiers générés depuis l'étape de build dans le dossier de Nginx
COPY --from=builder /usr/src/app/dist /usr/share/nginx/html

# Copier la configuration Nginx personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx en mode premier plan
CMD ["nginx", "-g", "daemon off;"]