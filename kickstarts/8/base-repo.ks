repo --name=BaseOS --mirrorlist=http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=BaseOS&infra=$infra
repo --name=AppStream --mirrorlist=http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=AppStream&infra=$infra
repo --name=PowerTools --mirrorlist=http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=PowerTools&infra=$infra
repo --name=epel --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch
repo --name=epel-next --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-next-$releasever&arch=$basearch
url --mirrorlist="http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=BaseOS&infra=$infra"
