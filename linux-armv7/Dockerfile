FROM dockcross/linux-armv7

RUN groupadd --gid 1000 node && useradd --uid 1000 --gid node --shell /bin/bash --create-home node
RUN groupadd --gid 2000 travis && useradd --uid 2000 --gid travis --shell /bin/bash --create-home travis

RUN apt-get -y update && \
  apt-get -y --no-install-recommends install \
    git curl gnupg apt-transport-https \
    && \
  curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://deb.nodesource.com/node_10.x buster main" | tee /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/node_10.x buster main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
  apt-get -y update && \
  apt-get -y install nodejs && \
  rm -rf /var/lib/apt/lists/*

USER node

ENV STRIP ${CROSS_ROOT}/bin/${CROSS_TRIPLE}-strip
ENV ARCH=arm
ENV ARM_VERSION=7
ENV TARGET_PLATFORM=linux

WORKDIR /app