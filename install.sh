#!/bin/bash

declare -a packages=(
	"git"
	"pip"
	"docker"
	"fish"
	"nvim"
	"kitty"
	"fzf"
	"chromium"
	"figma"
	"telegram"
	"spotify"
	"gimp"
	"ffmpeg"
	"fonts-powerline"
	"gestures"
	"warzone"
	"nvm"
	"zsh"
)
declare -a selects
loop=true
len=${#packages[@]}
opt=0
before=

trap "clear;stty sane;exit" 2
head() {
	tput bold
	echo "Setup installation"
	echo "Selection packages to install"
	tput sgr0
}
item() {
	tput cup $(($1 + 3)) 0
	echo -e "$2 $3  $4"
}
item() {
	local underline=$2
	local check=$3
	local package=${packages[$1]}

	local gly_arrow=" "
	local gly_check="◯"

	tput cup $(($1 + 3)) 0

	if [[ $underline ]];then
		gly_arrow="❯"
		package="\e[7m${package}\e[27m"
	fi
	if [[ "${selects[@]}" =~ "${packages[$1]}" ]];then gly_check="◉";fi;

	echo -e "${gly_arrow} ${gly_check}  ${package}"
}
menu() {
	for ((i=0; i < ${len}; i++));
	do 
		local underline=
		local check=

		if [[ $opt == $i ]];then underline=true;fi

		item $i $underline 
	done
	echo -en "\n"
}
refresh() {
	if [[ $opt -ne $before && $before -lt $len ]];then
		item $before 
	fi
	if [[ $opt -lt $len ]];then 
		item $opt true
	fi
}
footer() {
	tput bold
	echo "Select - <Space>, Continue - <Enter>"
	tput sgr0
}
key_handling() {
	read -rsN 1 key
	
	case "$key" in
		$'A') echo up;;
		$'B') echo dn;;
		$' ') echo espace;;
		$'\x0a') echo enter;;
		*) ;;
	esac
}
position() {
	before=$opt
	if [[ $cur == up ]];then ((opt--));fi;
	if [[ $cur == dn ]];then ((opt++));fi;
	if [[ $opt -lt 0 	  ]];then opt=$len;fi;
	if [[ $opt -gt $len ]];then opt=0;fi;
	if [[ $cur == espace ]];then
		if [[ "${selects[@]}" =~ "${packages[$opt]}" ]];then 
			selects=("${selects[@]/${packages[$opt]}}")
		else 
			selects+=( "${packages[$opt]}" )
		fi
	fi
	if [[ $cur == enter ]];then
		loop=false
	fi
}
clear;tput civis
head;menu;footer
while $loop; 
do
	cur=`key_handling`
	position
	refresh
done
tput cud1

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release -y -qq

if [[ "${selects[@]}" =~ "git" ]];then
	echo "Check Git installation"
	if (! which git );then
		echo "Installing...."
		sudo apt-get install git -y -qq
	else
		echo "Git is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "pip" ]];then
	echo "Check Python-Pip installation"
	if (! which pip );then
		if (! which python3);then
			echo "Error: Not found python3"
			exit 1
		fi
		echo "Installing...."
		sudo apt-get install python3-pip -y -qq

		echo "Installing pipenv"
		pip install pipenv
	else
		echo "Python-Pip is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "nvm" ]];then
	echo "Check nvm installation"
	if (! which nvm );then
		if (! which git );then
			echo "Error: Not found git"
			exit 1
		fi
		echo "Installing...."
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
		echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
		nvm install node
	fi
fi

if [[ "${selects[@]}" =~ "docker" ]];then
	echo "Check docker installation"
	if (! which docker );then
		if (! which curl );then
			echo "Error: Not found curl"
			exit 1
		fi
		echo "Installing...."
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
		echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

		sudo apt-get update 
		sudo apt-get install docker-ce docker-ce-cli containerd.io -y -qq

		## Add current user into docker group
		echo "Add current user into docker group"
		sudo groupadd docker 
		sudo usermod -aG docker $USER
		newgrp docker
	else
		echo "docker is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "fish" ]];then
	echo "Check fish installation"	
	if (! which fish );then 
		if (! which curl );then
			echo "Error: Not found curl"
			exit 1
		fi
		echo "Installing...."
		sudo apt-get install fish -y -qq
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

		## Add my config
		mkdir -p ~/.config/fish/
		mkdir -p ~/.config/omf/

		cp ./omf ~/.config/omf/
		cp ./fish ~/config/fish/
	else
		echo "fish is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "nvim" ]];then
	echo "Check nvim installation"
	if (! which nvim );then
		echo "Installing...."
		sudo apt-get install neovim -y -qq
		if (! which pip );then pip install --user neovim;fi;
		if (! which npm );then npm i -g neovim;fi;
		
		## Add my config
		mkdir -p ~/.config/nvim/
		cp ./nvim ~/.config/nvim/
	else 
		echo "nvim is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "kitty" ]];then
	echo "Check kitty installation"
	if (! which kitty );then
		echo "Installing...."
		sudo apt-get install kitty -y -qq

		# Add my config
		cp ./kitty ~/.config/kitty
	else
		echo "kitty is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "fzf" ]];then
	echo "Check fzf installation"
	if (! fzf );then
		echo "Installing...."
		sudo apt-get install fzf ripgrep bat fd -y -qq
	else 
		echo "fzf is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "chromium" ]];then
	echo "Check Chromium installation"
	if (! which chromium && which snap );then
		echo "Installing...."
		sudo snap install chromium
	else
		echo "Chromium is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "figma" ]];then
	echo "Check Figma installation"
	if (! which figma-linux && which snap );then
		echo "Installing...."
		sudo snap install figma-linux
	else
		echo "Figma is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "telegram" ]];then
	echo "Check Chromium installation"
	if (! which telegram-desktop && which snap );then
		echo "Installing...."
		sudo snap install telegram-desktop
	else
		echo "Telegram is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "spotify" ]];then
	echo "Check Spotify installation"
	if (! which spotify && which snap );then
		echo "Installing...."
		sudo snap install spotify
	else
		echo "Spotify is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "gimp" ]];then
	echo "Check GIMP installation"
	if (! which gimp && which snap );then
		echo "Installing...."
		sudo snap install gimp
	else
		echo "GIMP is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "ffmpeg" ]];then
	echo "Check FFmpeg installation"
	if (! which ffmpeg && which snap );then
		echo "Installing...."
		sudo snap install ffmpeg 
	else
		echo "FFmpeg is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "fonts-powerline" ]];then
	echo "Check Fonts Powerline installation"
	if [[ ! -d ~/.local/share/fonts ]];then
		echo "Installing...."
		sudo apt-get install fonts-powerline -y -qq
	else
		echo "Fonts Powerline is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "gestures" ]];then
	echo "Check Touchpad Gestures installation"
	if (! which libinput-gestures-setup );then
		echo "Installing...."
		sudo apt-get install libinput-tools -y -qq
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
		# Add my config
		cp ./libinput-gestures.conf ~/.config/
	else
		echo "Touchpad Gestures is already installed"
	fi
fi

if [[ "${selects[@]}" =~ "warzone" ]];then
	echo "Check Warzone2100 installation"
	if (! which warzone2100  && which snap );then
		echo "Installing...."
		sudo snap install warzone2100
	else
		echo "Warzone2100 is already installed"
	fi
fi

#sudo apt-get update && sudo apt-get upgrade -y
#
#sudo apt install \
#	gnupg \
#	lsb-release \
#	openjdk-8-jdk-headless \
#	ubuntu-restricted-extras \
#	libavcodec-extra \
# Configurar npm for guarda global packages in home

