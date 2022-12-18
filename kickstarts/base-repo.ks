repo --name=centos-baseos --metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-$releasever-stream&arch=$basearch&protocol=https,http
repo --name=centos-appstream --metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-$releasever-stream&arch=$basearch&protocol=https,http
repo --name=centos-crb --metalink=https://mirrors.centos.org/metalink?repo=centos-crb-$releasever-stream&arch=$basearch&protocol=https,http
url --mirrorlist="https://mirrors.centos.org/metalink?repo=centos-baseos-$releasever-stream&arch=$basearch&protocol=https,http"
