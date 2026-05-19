FROM node:20-alpine AS builder

WORKDIR /app/client

COPY client/package*.json ./
RUN npm install

COPY client/ .
RUN npm run build


FROM node:20-alpine

WORKDIR /app/server

COPY server/package*.json ./
RUN npm install --omit=dev

COPY server/ .

RUN mkdir -p ./public

# React CRA
#COPY --from=builder /app/client/build ./public

# For Vite use this instead:
COPY --from=builder /app/client/dist ./public

ENV NODE_ENV=production

EXPOSE 3000

CMD ["node", "server.js"]