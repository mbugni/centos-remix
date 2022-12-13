# kde-base-it_IT.ks
#
# Provides italian localization for the KDE desktop.

%include base-desktop-it_IT.ks

%packages --excludeWeakdeps

kf5-ki18n

%end

%post

echo ""
echo "POST KDE BASE it_IT **********************************"
echo ""

# Defaults for user configuration
mkdir -p /etc/skel/.config/KDE

# Plasma locale settings
cat > /etc/xdg/plasma-localerc << PLASMALOCALE_EOF
[Formats]
LANG=it_IT.UTF-8

[Translations]
LANGUAGE=it
PLASMALOCALE_EOF

# KDE user locale settings
cat >> /etc/xdg/kdeglobals << GLOBALS_EOF
[Locale]
Country=it

[Translations]
LANGUAGE=it
GLOBALS_EOF

# KDE Sonnet locale settings
cat > /etc/skel/.config/KDE/Sonnet.conf << SONNET_EOF
[General]
autodetectLanguage=true
defaultLanguage=it_IT
SONNET_EOF

%end
