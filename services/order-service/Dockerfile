# Étape 1 : Construction de l’application
FROM node:16-alpine AS builder
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# (Optionnel) Déclencher la construction si nécessaire
# RUN npm run build

# Étape 2 : Image finale
FROM node:16-alpine AS runner
WORKDIR /usr/src/app

ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

COPY package*.json ./
RUN npm install --only=production

COPY --from=builder /usr/src/app .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Exposer le port pour order-service (défini à 3002)
EXPOSE 3002

CMD ["npm", "start"]