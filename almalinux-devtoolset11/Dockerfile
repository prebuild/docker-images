FROM almalinux:8-minimal

USER 0

# Need shadow-utils for groupadd and useradd
# TODO: "source scl_source enable gcc-toolset-11" only applies to current session
RUN curl -fsSL https://rpm.nodesource.com/setup_18.x | bash - && \
  microdnf install -y shadow-utils make nodejs python3 gcc-toolset-11 && \
  source scl_source enable gcc-toolset-11 && \
  ln -s python3 /usr/bin/python && \
  microdnf clean all && \
  rm -rf /var/cache/yum && \
  groupadd -g 1000 node && useradd -g 1000 -u 1000 -m node && \
  groupadd -g 2000 travis && useradd -g 2000 -u 2000 -m travis && \
  npm -v && \
  python --version

USER node
ENV HOME /home/node

# Testing
RUN gcc -dumpversion
RUN echo -e '#include <stdio.h>\n#include <gnu/libc-version.h>\nint main(){printf("%u.%u\\n",__GLIBC__,__GLIBC_MINOR__);}' | gcc -xc++ -o dummy - && ./dummy

# Disable npm update check
ENV NO_UPDATE_NOTIFIER true
ENV npm_config_update_notifier false

WORKDIR /app
