repo --name=BaseOS --mirrorlist=http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=BaseOS&infra=$infra
repo --name=AppStream --mirrorlist=http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=AppStream&infra=$infra
repo --name=PowerTools --mirrorlist=http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=PowerTools&infra=$infra
url --mirrorlist="http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=BaseOS&infra=$infra"
