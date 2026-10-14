# Stage 1: build and test
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm test

# Stage 2: small runtime image
FROM node:22-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY package*.json ./
RUN npm ci --omit=dev
COPY --from=build /app/app.js /app/index.js ./
USER node
EXPOSE 3000
CMD ["node", "index.js"]
