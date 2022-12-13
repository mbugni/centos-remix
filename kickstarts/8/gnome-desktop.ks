# gnome-desktop.ks
#
# Provides a basic Linux box based on GNOME desktop.

%include base-desktop.ks
%include base-extras.ks
%include base-live.ks
%include gnome-base.ks

%packages --excludeWeakdeps

# Connectivity
# gnome-shell-extension-gsconnect
gvfs-mtp

# Graphics
cheese

# Multimedia
nautilus-extensions
totem
sushi

%end

%post

echo ""
echo "POST GNOME DESKTOP ***********************************"
echo ""

# Default settings for GNOME environment
cat > /etc/dconf/db/local.d/01-remix-gnome-settings << EOF_SETTINGS
# Global fonts settings
[org/gnome/desktop/interface]
document-font-name='Noto Sans 11'
font-name='Noto Sans 11'
monospace-font-name='Noto Mono 11'

[org/gnome/desktop/wm/preferences]
titlebar-font='Noto Sans 11'

[org/gnome/settings-daemon/plugins/xsettings]
antialiasing='rgba'
hinting='full'

# Disable device automount
[org/gnome/desktop/media-handling]
automount=false
automount-open=false
EOF_SETTINGS

# Update configuration
dbus-launch --exit-with-session dconf update

%end
