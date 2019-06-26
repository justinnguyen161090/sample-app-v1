FROM node:alpine AS builder

WORKDIR /app

ADD package.json /app/package.json
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
# ADD package.json /usr/src/app/package.json


# Runtime image from here
FROM node:alpine

EXPOSE 3000

WORKDIR /app

COPY --from=builder /app .

ADD server.js /app/server.js

RUN npm install --production

ENTRYPOINT ["node", "server.js"]
