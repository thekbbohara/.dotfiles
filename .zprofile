echo "Welcome $USER"
if [[ "$(tty)" == "/dev/tty1" ]]; then
  pgrep Hyprland || exec Hyprland
fi

export PATH=$PATH:$(go env GOPATH)/bin
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=kvantum
