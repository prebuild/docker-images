FROM node:lts-alpine

RUN addgroup -g 2000 travis && \
  adduser -u 2000 -G travis -s /bin/sh -D travis && \
  apk --no-cache add g++ gcc libgcc libstdc++ linux-headers make python3 git && \
  ln -sf python3 /usr/bin/python && \
  python --version

USER node
ENV HOME /home/node

# Disable npm update check
ENV NO_UPDATE_NOTIFIER true
ENV npm_config_update_notifier false

WORKDIR /app
