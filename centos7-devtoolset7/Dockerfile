FROM centos/devtoolset-7-toolchain-centos7:7

USER 0

RUN groupadd -g 1000 node && useradd -g 1000 -u 1000 -m node && \
  groupadd -g 2000 travis && useradd -g 2000 -u 2000 -m travis && \
  curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - && \
  yum install -y make nodejs && \
  npm -v

USER node

WORKDIR /app
