# base-centos.ks
#
# Defines the basics for a CentOS live system.

# Use Anaconda installer from Hyperscale SIG
repo --name=centos-hyperscale-spin --mirrorlist=http://mirrorlist.centos.org/?release=$releasever-stream&arch=$basearch&repo=hyperscale-packages-spin

%packages --excludeWeakdeps

# Repositories
centos-stream-release
centos-stream-repos
epel-release

%end

%post

echo ""
echo "POST BASE CENTOS *************************************"
echo ""

# Enable PowerTools repo
dnf config-manager --set-enabled powertools

%end
