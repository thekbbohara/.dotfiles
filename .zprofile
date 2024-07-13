echo "Welcome $USER"
if [[ "$(tty)" == "/dev/tty1" ]]; then
  pgrep Hyprland || exec Hyprland
fi
