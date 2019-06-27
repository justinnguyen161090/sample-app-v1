# FROM node:10-alpine AS builder

# WORKDIR /app

# ADD package.json /app/package.json

# Runtime image from here
FROM node:10-alpine

# EXPOSE 3000

WORKDIR /app

# COPY --from=builder /app .
ADD package.json /app/package.json
ADD server.js /app/server.js

RUN npm install --production

ENTRYPOINT ["node", "server.js"]
