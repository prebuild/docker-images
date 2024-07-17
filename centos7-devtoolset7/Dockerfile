FROM centos/devtoolset-7-toolchain-centos7:7

USER 0

#
# need to add Centos7.7 repos (same as 7.6 but: s/7.6.1810/7.7.1908/) at
# end of /etc/yum.repos.d/CentOS-Vault.repo
#
# C7.7.1908
# [C7.7.1908-base]
# name=CentOS-7.7.1908 - Base
# baseurl=http://vault.centos.org/7.7.1908/os/$basearch/
# gpgcheck=1
# gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
# enabled=1

# [C7.7.1908-updates]
# name=CentOS-7.7.1908 - Updates
# baseurl=http://vault.centos.org/7.7.1908/updates/$basearch/
# gpgcheck=1
# gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
# enabled=1

# [C7.7.1908-extras]
# name=CentOS-7.7.1908 - Extras
# baseurl=http://vault.centos.org/7.7.1908/extras/$basearch/
# gpgcheck=1
# gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
# enabled=1

# need to disable fastmirror plugin in /etc/yum/pluginconf.d/fastestmirror.conf
# by setting enabled=0

#
# need to make the following edits.
#
RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
RUN sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
RUN sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo

# yum install make python3
# python3 fixups below

#
# install node
#
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# nvm install 16


# Using Node.js 16 here instead of LTS because >= 18 doesn't support CentOS 7. See:
# - https://nodejs.org/en/blog/announcements/v18-release-announce/#toolchain-and-compiler-upgrades
# - https://github.com/prebuild/prebuildify-cross/issues/13
# RUN groupadd -g 1000 node && useradd -g 1000 -u 1000 -m node && \
#   groupadd -g 2000 travis && useradd -g 2000 -u 2000 -m travis && \
#   curl -fsSL https://rpm.nodesource.com/setup_16.x | bash - && \
#   yum install -y make nodejs python3 && \
#   sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' /usr/bin/yum && \
#   sed -i 's/#! \/usr\/bin\/python/#! \/usr\/bin\/python2/' /usr/libexec/urlgrabber-ext-down && \
#   ln -sf python3 /usr/bin/python && \
#   yum clean all && \
#   rm -rf /var/cache/yum && \
#   npm -v && \
#   python --version

# USER node
# ENV HOME=/home/node

# Disable npm update check
ENV NO_UPDATE_NOTIFIER=true
ENV npm_config_update_notifier=false

WORKDIR /app
