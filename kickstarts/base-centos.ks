# base-centos.ks
#
# Defines the basics for a CentOS live system.

services --disabled=kdump

%addon com_redhat_kdump --disable
%end

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

# Fix missing installer icon (see https://issues.redhat.com/browse/RHEL-13713)
desktop-file-edit --set-icon=anaconda /usr/share/applications/liveinst.desktop

%end
