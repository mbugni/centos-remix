FROM quay.io/centos/centos:stream9
RUN dnf --assumeyes install epel-release glibc-gconv-extra && \
dnf --assumeyes --setopt='tsflags=nodocs' --setopt='install_weak_deps=False' \
install bash-completion distribution-gpg-keys kiwi-cli kiwi-systemdeps && \
dnf --assumeyes clean all && \
rm /etc/rpm/* -rf