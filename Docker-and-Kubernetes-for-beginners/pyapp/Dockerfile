# -- Stage 1: Build the React App --
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# -- Stage 2: Production Image --
FROM node:22-alpine
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 3000
ENV PORT=3000
CMD ["node", "server.js"]