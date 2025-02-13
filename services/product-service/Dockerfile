# Stage 1 : Construction du service
FROM node:18-alpine AS builder
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# Stage 2 : Image finale
FROM node:18-alpine AS runner
WORKDIR /usr/src/app

ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

COPY package*.json ./
RUN npm install --only=production

COPY --from=builder /usr/src/app .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

CMD ["npm", "start"]