FROM centos/devtoolset-7-toolchain-centos7:7

USER 0

RUN groupadd -g 1000 node && useradd -g 1000 -u 1000 -m node && \
  groupadd -g 2000 travis && useradd -g 2000 -u 2000 -m travis && \
  curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - && \
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
