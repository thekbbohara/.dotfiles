
#!/bin/bash

# Update system and install base dependencies
echo "Updating system and installing base packages..."
sudo pacman -Syu --noconfirm

# Install packages from pacman repositories
echo "Installing packages from pacman repositories..."
sudo pacman -S --needed stow zsh zoxide wl-clipboard clipse waybar swaync hypridle hyprlock pypr exa neovim alacritty nautilus rofi fzf grim slurp noto-fonts noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd xdg-desktop-portal-hyprland brightnessctl qt6ct qt5ct unzip  --noconfirm 
# Install missing font (ttf-firacode-nerd) from AUR using yay
echo "Installing ttf-firacode-nerd from AUR..."
yay -S --needed ttf-firacode-nerd  --noconfirm

# Install packages from AUR using yay (if not in pacman)
echo "Installing AUR packages using yay..."
yay -S --needed google-chrome pyprland clipse swww loupe mpv  --noconfirm

# Install zinit (Zsh plugin manager)
# echo "Installing zinit..."
# sh -c "$(curl -fsSL https://git.io/zinit-install)"

# Make zsh the default shell
# echo "Setting zsh as the default shell..."
# which zsh
# chsh -s "$(which zsh)"

# Print installation complete message
# echo "All packages and configurations have been installed and set up!"

# Restart shell to apply changes
# exec zsh

yay -S piper-tts-bin piper-voices speech-dispatcher --needed

# overskride, hyprpicker,  dracula-gtk-theme
