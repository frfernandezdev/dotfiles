set -U fish_user_paths $fish_user_paths $HOME/.local/bin/
set fish_greeting
set EDITOR "nvim"

alias icat="kitty +kitten icat"

function fish_greeting
	neofetch
end

function ws
	pushd ~/workstation/$argv
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
	set count (count $argv | tr -d \n)
	if test "$count" = 2; and test -d "$argv[1]"
		set from (echo $argv[1] | trim-right /)
		set to (echo $argb[2])
		command cp -r $from $to
	else 
		command cp $argv
	end

end


