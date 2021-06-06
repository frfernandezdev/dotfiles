#!/bin/bash

if [[ -d ~/.config/nvim ]];then
	echo "Check config nvim"

	if diff nvim/init.vim ~/.config/nvim/init.vim;then
		cp ~/.config/nvim/init.vim ./nvim/init.vim
	fi
	if diff nvim/keys.vim ~/.config/nvim/keys.vim;then
		cp ~/.config/nvim/keys.vim ./nvim/keys.vim
	fi
	if diff nvim/line.vim ~/.config/nvim/line.vim;then
		cp ~/.config/nvim/line.vim ./nvim/line.vim
	fi
	if diff nvim/general.vim ~/.config/nvim/general.vim;then
		cp ~/.config/nvim/general.vim ./nvim/general.vim
	fi
	if diff nvim/plugins.vim ~/.config/nvim/plugins.vim;then
		cp ~/.config/nvim/plugins.vim ./nvim/plugins.vim
	fi
	if diff nvim/coc-settings.json ~/.config/nvim/coc-settings.json;then
		cp ~/.config/nvim/coc-settings.json ./nvim/coc-settings.json
	fi
	if [[ -d ~/.config/coc ]];then
		if diff coc/memos.json ~/.config/coc/memos.json;then
			cp ~/.config/coc/memos.json ./coc/memos.json
		fi
		if diff coc/extensions/db.json ~/.config/coc/extensions/db.json;then
			cp ~/.config/coc/extensions/db.json ./coc/extensions/db.json
		fi
		if diff coc/extensions/package.json ~/.config/coc/extensions/package.json;then
			cp ~/.config/coc/extensions/package.json ./coc/extensions/package.json
		fi
		if diff coc/extensions/package-lock.json ~/.config/coc/extensions/package-lock.json;then
			cp ~/.config/coc/extensions/package-lock.json ./coc/extensions/package-lock.json
		fi
	fi
fi

if [[ -d ~/.config/kitty ]];then
	echo "Check config kitty"
	
	if diff kitty/kitty.conf ~/.config/kitty/kitty.conf;then
		cp ~/.config/kitty/kitty.conf ./kitty/kitty.conf
	fi
fi
