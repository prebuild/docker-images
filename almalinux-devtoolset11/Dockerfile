FROM almalinux:8-minimal

USER 0

# Need shadow-utils for groupadd and useradd
RUN curl -fsSL https://rpm.nodesource.com/setup_18.x | bash - && \
  microdnf install -y shadow-utils make nodejs python3.11 gcc-toolset-11 git && \
  ln -s python3.11 /usr/bin/python && \
  ln -sf python3.11 /usr/bin/python3 && \
  microdnf clean all && \
  rm -rf /var/cache/yum && \
  groupadd -g 1000 node && useradd -g 1000 -u 1000 -m node && \
  groupadd -g 2000 travis && useradd -g 2000 -u 2000 -m travis && \
  npm -v && \
  python --version

USER node
ENV HOME=/home/node

# Add gcc to PATH as alternative to "source scl_source enable gcc-toolset-11"
ENV PATH=/opt/rh/gcc-toolset-11/root/usr/bin:$PATH

# Disable npm update check
ENV NO_UPDATE_NOTIFIER=true
ENV npm_config_update_notifier=false

WORKDIR /app
