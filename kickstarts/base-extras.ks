# base-extras.ks
#
# Adds extra components that the Fedora Project doesn't want to ship.

# Extra repositories
repo --name=epel --metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch&infra=$infra&content=$contentdir
repo --name=epel-next --metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-next-$releasever&arch=$basearch&infra=$infra&content=$contentdir
repo --name=free-el-tainted --metalink=https://mirrors.rpmfusion.org/metalink?repo=free-el-tainted-$releasever&arch=$basearch
repo --name=free-el-updates-released --metalink=http://mirrors.rpmfusion.org/metalink?repo=free-el-updates-released-$releasever&arch=$basearch
repo --name=nonfree-el-tainted --metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-el-tainted-$releasever&arch=$basearch
repo --name=nonfree-el-updates --metalink=http://mirrors.rpmfusion.org/metalink?repo=nonfree-el-updates-released-$releasever&arch=$basearch

%packages --excludeWeakdeps

# Extra repositories
epel-next-release

# RPM Fusion repositories
rpmfusion-free-release
rpmfusion-free-release-tainted
rpmfusion-nonfree-release
rpmfusion-nonfree-release-tainted

# Appstream data
# rpmfusion-*-appstream-data

# Multimedia
ffmpeg
gstreamer1-libav
gstreamer1-vaapi
gstreamer1-plugins-bad-freeworld
gstreamer1-plugins-ugly
intel-media-driver
libva-intel-driver

# Tools
unrar

%end
