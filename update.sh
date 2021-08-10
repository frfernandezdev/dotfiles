#!/bin/bash

if [[ -d ~/.config/nvim ]];then
	echo "Check config nvim"

	if ! diff -q ./nvim/init.vim ~/.config/nvim/init.vim &>/dev/null;then
		cp ~/.config/nvim/init.vim ./nvim/init.vim
	fi
	if ! diff -q ./nvim/keys.vim ~/.config/nvim/keys.vim &>/dev/null;then
		cp ~/.config/nvim/keys.vim ./nvim/keys.vim
	fi
	if ! diff -q ./nvim/line.vim ~/.config/nvim/line.vim &>/dev/null;then
		cp ~/.config/nvim/line.vim ./nvim/line.vim
	fi
	if ! diff -q ./nvim/general.vim ~/.config/nvim/general.vim &>/dev/null;then
		cp ~/.config/nvim/general.vim ./nvim/general.vim
	fi
	if ! diff -q ./nvim/plugins.vim ~/.config/nvim/plugins.vim &>/dev/null;then
		cp ~/.config/nvim/plugins.vim ./nvim/plugins.vim
	fi
	if ! diff -q ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json &>/dev/null;then
		cp ~/.config/nvim/coc-settings.json ./nvim/coc-settings.json
	fi
	if [[ -d ~/.config/coc ]];then
		if ! diff -q ./coc/memos.json ~/.config/coc/memos.json &>/dev/null;then
			cp ~/.config/coc/memos.json ./coc/memos.json
		fi
		if ! diff -q ./coc/extensions/db.json ~/.config/coc/extensions/db.json &>/dev/null;then
			cp ~/.config/coc/extensions/db.json ./coc/extensions/db.json
		fi
		if ! diff -q ./coc/extensions/package.json ~/.config/coc/extensions/package.json &>/dev/null;then
			cp ~/.config/coc/extensions/package.json ./coc/extensions/package.json
		fi
		if ! diff -q ./coc/extensions/package-lock.json ~/.config/coc/extensions/package-lock.json &>/dev/null;then
			cp ~/.config/coc/extensions/package-lock.json ./coc/extensions/package-lock.json
		fi
	fi
fi

if [[ -d ~/.config/kitty ]];then
	echo "Check config kitty"
	
	if ! diff -q ./kitty/kitty.conf ~/.config/kitty/kitty.conf &>/dev/null;then
		cp ~/.config/kitty/kitty.conf ./kitty/kitty.conf
	fi
fi
