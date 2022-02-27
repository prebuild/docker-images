FROM dockcross/linux-armv6

RUN groupadd --gid 1000 node && useradd --uid 1000 --gid node --shell /bin/bash --create-home node && \
  groupadd --gid 2000 travis && useradd --uid 2000 --gid travis --shell /bin/bash --create-home travis && \
  apt-get -y update && \
  apt-get -y --no-install-recommends install git curl gnupg apt-transport-https && \
  echo Package: nodejs >> /etc/apt/preferences.d/preferences && \
  echo Pin: origin deb.nodesource.com >> /etc/apt/preferences.d/preferences && \
  echo Pin-Priority: 1000 >> /etc/apt/preferences.d/preferences && \
  curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
  apt-get -y install nodejs && \
  npm -v && \
  test -f ${CROSS_ROOT}/bin/${CROSS_TRIPLE}-strip && \
  rm -rf /var/lib/apt/lists/*

USER node

ENV PREBUILD_STRIP_BIN ${CROSS_ROOT}/bin/${CROSS_TRIPLE}-strip
ENV PREBUILD_ARCH arm
ENV PREBUILD_ARMV 6
ENV PREBUILD_PLATFORM linux

# TODO: These are for backwards compat. Remove once we have versioning.
ENV STRIP ${PREBUILD_STRIP_BIN}
ENV ARCH ${PREBUILD_ARCH}
ENV ARM_VERSION ${PREBUILD_ARMV}
ENV TARGET_PLATFORM ${PREBUILD_PLATFORM}

# Disable npm update check
ENV NO_UPDATE_NOTIFIER true
ENV npm_config_update_notifier false

# Set inherited dockcross labels to empty values.
# Labels can't be deleted (https://github.com/moby/moby/issues/3465)
LABEL org.label-schema.build-date=
LABEL org.label-schema.name=
LABEL org.label-schema.schema-version=
LABEL org.label-schema.vcs-ref=
LABEL org.label-schema.vcs-url=
LABEL org.label-schema.version=

WORKDIR /app
