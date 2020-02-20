FROM dockcross/android-arm

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

ENV PREBUILD_STRIP_BIN ${CROSS_ROOT}/bin/${CROSS_TRIPLE}-strip
ENV PREBUILD_ARCH arm
ENV PREBUILD_ARMV 8
ENV PREBUILD_PLATFORM android

# TODO: These are for backwards compat. Remove once we have versioning.
ENV STRIP ${PREBUILD_STRIP_BIN}
ENV ARCH ${PREBUILD_ARCH}
ENV ARM_VERSION ${PREBUILD_ARMV}
ENV TARGET_PLATFORM ${PREBUILD_PLATFORM}

ENV GYP_DEFINES target_arch=arm android_target_arch=arm host_os=linux OS=android

WORKDIR /app
