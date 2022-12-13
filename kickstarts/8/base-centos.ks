# base-centos.ks
#
# Defines the basics for a CentOS live system.

%packages --excludeWeakdeps

# Repositories
centos-stream-release
centos-stream-repos

%end

%post

echo ""
echo "POST BASE CENTOS *************************************"
echo ""

# Enable PowerTools repo
dnf config-manager --set-enabled powertools

%end
