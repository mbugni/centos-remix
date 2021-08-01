# base-remix.ks
#
# Adds extra repos for software that the Fedora Project doesn't want to ship.

# Extra repositories
repo --name=rpmfusion-free-el-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-el-updates-released-$releasever&arch=$basearch
repo --name=rpmfusion-nonfree-el-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-el-updates-released-$releasever&arch=$basearch
repo --name=rpmfusion-free-el-tainted --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-el-tainted-$releasever&arch=$basearch

%packages --excludeWeakdeps

# RPM Fusion repositories
rpmfusion-free-release
rpmfusion-free-release-tainted
rpmfusion-nonfree-release
rpmfusion-nonfree-release-tainted

# Appstream data
rpmfusion-*-appstream-data

# Multimedia
gstreamer1-libav
# gstreamer1-vaapi
gstreamer1-plugins-bad-freeworld
gstreamer1-plugins-ugly
libdvdcss

# Tools
unrar

%end
