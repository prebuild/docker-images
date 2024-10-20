FROM centos/devtoolset-7-toolchain-centos7:7

USER 0

# Using Node.js 16 here instead of LTS because >= 18 doesn't support CentOS 7. See:
# - https://nodejs.org/en/blog/announcements/v18-release-announce/#toolchain-and-compiler-upgrades
# - https://github.com/prebuild/prebuildify-cross/issues/13
#
# Can no longer be built: mirrorlist.centos.org is offline.
RUN groupadd -g 1000 node && useradd -g 1000 -u 1000 -m node && \
  groupadd -g 2000 travis && useradd -g 2000 -u 2000 -m travis && \
  curl -fsSL https://rpm.nodesource.com/setup_16.x | bash - && \
  yum install -y make nodejs python3 && \
  sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' /usr/bin/yum && \
  sed -i 's/#! \/usr\/bin\/python/#! \/usr\/bin\/python2/' /usr/libexec/urlgrabber-ext-down && \
  ln -sf python3 /usr/bin/python && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  npm -v && \
  python --version

USER node
ENV HOME /home/node

# Disable npm update check
ENV NO_UPDATE_NOTIFIER true
ENV npm_config_update_notifier false

WORKDIR /app
