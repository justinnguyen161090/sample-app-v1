FROM node:alpine AS builder

WORKDIR /app

ONBUILD ADD package.json /app/package.json


# Runtime image from here
FROM node:alpine

# EXPOSE 3000

WORKDIR /app

ONBUILD COPY --from=builder /app .

ONBUILD ADD server.js /app/server.js

ONBUILD RUN npm install --production

ENTRYPOINT ["node", "server.js"]
