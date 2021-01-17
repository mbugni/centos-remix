# base-liveinst.ks
#
# Defines the basics for a live install system.

%post

echo ""
echo "POST BASE LIVEINST ***********************************"
echo ""

# Anaconda live-install launcher
cat > /usr/bin/liveinst << EOF_LIVEINST
ANACONDA="anaconda --liveinst --graphical"

# load modules that would get loaded by the initramfs (#230945)
for i in raid0 raid1 raid5 raid6 raid456 raid10 dm-mod dm-zero dm-mirror dm-snapshot dm-multipath dm-round-robin vfat dm-crypt cbc sha256 lrw xts iscsi_tcp iscsi_ibft; do /sbin/modprobe \$i 2>/dev/null ; done

if [ -f /etc/system-release ]; then
    export ANACONDA_PRODUCTNAME=\$( cat /etc/system-release | sed -r -e 's/ *release.*//' )
    export ANACONDA_PRODUCTVERSION=\$( cat /etc/system-release | sed -r -e 's/^.* ([0-9\.]+).*\$/\1/' )
fi

# set PRODUCTVARIANT if this is a Fedora Workstation live image
# FIXME really, livemedia-creator should include .buildstamp in live
# images, if it did, we could remove this:
# https://github.com/weldr/lorax/issues/350
if [ -f /etc/os-release ]; then
    variantid=\$( grep VARIANT_ID /etc/os-release | tail -1 | cut -d= -f2)
    if [ "\$variantid" = "workstation" ]; then
        export ANACONDA_PRODUCTVARIANT="Workstation Live"
    fi
fi

export ANACONDA_BUGURL=\${ANACONDA_BUGURL:="https://bugzilla.redhat.com/bugzilla/"}

RELEASE=\$(rpm -q --qf '%{Release}' --whatprovides system-release)
if [ "\${RELEASE:0:2}" = "0." ]; then
    export ANACONDA_ISFINAL="false"
else
    export ANACONDA_ISFINAL="true"
fi

export PATH=/sbin:/usr/sbin:\$PATH

if [ -x /usr/sbin/getenforce ]; then
    current=\$(/usr/sbin/getenforce)
    /usr/sbin/setenforce 0
fi

if [ -z "\$(sestatus | grep enabled)" ]; then
    ANACONDA="\$ANACONDA --noselinux"
fi

# unmount anything that shouldn't be mounted prior to install
anaconda-cleanup \$ANACONDA \$*

if [ -z \$LC_ALL ]; then
    # LC_ALL not set, set it to \$LANG to make Python's default encoding
    # detection work
    export LC_ALL=\$LANG
fi

# Force the X11 backend since sudo and wayland do not mix
export GDK_BACKEND=x11

if [ -x /usr/bin/udisks ]; then
    /usr/bin/udisks --inhibit -- \$ANACONDA \$*
else
    \$ANACONDA \$*
fi

if [ -e /tmp/updates ]; then rm -r /tmp/updates; fi
if [ -e /tmp/updates.img ]; then rm /tmp/updates.img; fi

rm -f /dev/.in_sysinit 2>/dev/null

if [ -n "\$current" ]; then
    /usr/sbin/setenforce \$current
fi
EOF_LIVEINST

chmod +x /usr/bin/liveinst

# Create live-install desktop entry
cat > /usr/share/applications/liveinst.desktop << EOF_DESKTOP
[Desktop Entry]
Name[it]=Installa sul disco rigido
Name=Install to Hard Drive
GenericName[it]=Installa
GenericName=Install
Comment[it]=Installa il live CD sul disco rigido
Comment=Install the live CD to your hard disk
Categories=System;Utility;X-Red-Hat-Base;X-Fedora;GNOME;GTK;
Exec=/usr/bin/sudo /usr/bin/liveinst
Terminal=false
Type=Application
Icon=drive-harddisk
StartupNotify=true
NoDisplay=true
X-Desktop-File-Install-Version=0.26
EOF_DESKTOP

%end
