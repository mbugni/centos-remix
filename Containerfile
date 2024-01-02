FROM quay.io/centos/centos:stream9
ADD tools/ks-package-list.py /usr/local/bin/ks-package-list
RUN chmod ugo+x /usr/local/bin/ks-package-list && \
dnf --assumeyes --setopt='tsflags=nodocs' --setopt='install_weak_deps=False' \
install bash-completion pykickstart lorax-lmc-novirt && \
dnf --assumeyes clean all && \
rm /etc/rpm/* -rf