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

# Enable CRB (previously named PowerTools) repo
dnf config-manager --set-enabled crb

%end
