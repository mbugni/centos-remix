ARG releasever=

FROM quay.io/centos/centos:stream${releasever}

RUN rm /etc/rpm/* -f && \
    dnf -y install glibc-all-langpacks lorax-lmc-novirt && \
    dnf clean all && \
    mkdir /results
