FROM dockcross/android-arm64

RUN groupadd --gid 1000 node && useradd --uid 1000 --gid node --shell /bin/bash --create-home node
RUN groupadd --gid 2000 travis && useradd --uid 2000 --gid travis --shell /bin/bash --create-home travis

RUN apt-get -y update && \
  apt-get -y --no-install-recommends install \
    git curl gnupg apt-transport-https \
    && \
  curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://deb.nodesource.com/node_10.x bullseye main" | tee /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/node_10.x bullseye main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
  echo Package: nodejs >> /etc/apt/preferences.d/preferences && \
  echo Pin: origin deb.nodesource.com >> /etc/apt/preferences.d/preferences && \
  echo Pin-Priority: 1000 >> /etc/apt/preferences.d/preferences && \
  apt-get -y update && \
  apt-get -y install nodejs && \
  npm -v && \
  rm -rf /var/lib/apt/lists/*

USER node

ENV PREBUILD_STRIP_BIN ${CROSS_ROOT}/bin/${CROSS_TRIPLE}-strip
ENV PREBUILD_ARCH arm64
ENV PREBUILD_ARMV 8
ENV PREBUILD_PLATFORM android

# TODO: These are for backwards compat. Remove once we have versioning.
ENV STRIP ${PREBUILD_STRIP_BIN}
ENV ARCH ${PREBUILD_ARCH}
ENV ARM_VERSION ${PREBUILD_ARMV}
ENV TARGET_PLATFORM ${PREBUILD_PLATFORM}

ENV GYP_DEFINES target_arch=arm64 android_target_arch=arm64 host_os=linux OS=android

WORKDIR /app
