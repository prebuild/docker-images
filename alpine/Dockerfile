FROM node:lts-alpine

RUN addgroup -g 2000 travis && \
  adduser -u 2000 -G travis -s /bin/sh -D travis && \
  apk --no-cache add g++ gcc libgcc libstdc++ linux-headers make python git

USER node

# Disable npm update check
ENV NO_UPDATE_NOTIFIER true

WORKDIR /app
