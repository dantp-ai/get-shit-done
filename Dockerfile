FROM node:18-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build:hooks

ENV INSTALL_LOCATION=global

ENTRYPOINT ["sh", "-c", "node bin/install.js --claude --${INSTALL_LOCATION}"]
