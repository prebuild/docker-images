FROM centos/devtoolset-7-toolchain-centos7

USER 0

RUN groupadd -g 1000 node && useradd -g 1000 -u 1000 -m node && \
  groupadd -g 2000 travis && useradd -g 2000 -u 2000 -m travis

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
  yum install -y nodejs

USER node

WORKDIR /app
