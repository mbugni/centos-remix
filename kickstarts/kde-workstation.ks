# kde-workstation.ks
#
# Provides a complete KDE workstation. Includes office, print and scan support.

%include kde-desktop.ks
%include base-workstation.ks

%packages --excludeWeakdeps

# Multimedia
k3b

# Office
libreoffice-gtk3

# Printers and scanners
kde-print-manager
skanlite

%end
