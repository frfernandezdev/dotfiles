# There all install script

sudo apt-get update 

sudo apt install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release \
	git \
	nodejs

# Install docker 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update 
sudo apt-get install docker-ce docker-ce-cli containerd.io 

## Add current user into docker group
sudo groupadd docker 
sudo usermod -aG docker $USER
newgrp docker

# --------------


# Install NodeJS 
sudo snap install node --classic
# --------------

# Install Fish
sudo apt-install fish 
chsh -s /usr/bin/fish
mkdir -p ~/.config/fish 
touch ~/.config/fish/config.fish
echo "set -g -x fish_gretting ''" > ~/.config/fish/config.fish

## Installing Oh My Fish
curl -L https://get.oh-my.fish | fish

## Plugin Manater 
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

## Fzf for fish
fisher install PatrickF1/fzf.fish
# ------------

# Install Neovim
sudo apt install neovim

# --------------

# Install Kitty
sudo apt-get install kitty

# -------------

# Install lib for Gnome Video compatibility
sudo apt-get install ubuntu-restricted-extras -yy

# Install Gnome Clock
sudo snap install gnome-clocks

# Install Chromium
sudo snap install chromium 

# Install Figma
sudo snap install figma-linux

# Install Warzone2100
sudo snap install warzone2100

# Install telegram
sudo snap install telegram-desktop

# Install spotify
sudo snap install spotify

# Install GIMP
sudo snap install gimp

# Firefox lib play video
sudo apt install libavcodec-extra

# Install FFmpeg
sudo apt install ffmpeg

# Install Powerline fonts 
sudo apt-get install fonts-powerline

# Install Touchpad Gestures
sudo apt install libinput-tools
					
sudo gpasswd -a $USER input

git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
sudo ./libinput-gestures-setup install

libinput-gestures-setup start
libinput-gestures-setup autostart

git clone https://gitlab.com/cunidev/gestures
cd gestures
meson build --prefix=/usr
ninja -C build
sudo ninja -C build install

# Install FzF, Ripgrep
sudo apt install fzf ripgrep bat fd

# Intall Python Pip
sudo apt install python3-pip

## Install pipenv
pip install pipenv
## Install Neovim
pip install neovim
