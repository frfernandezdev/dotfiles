set -x anchor_glyph 		\u2693
set -x branch_glyph 		\uF418
set -x detached_glyph 	\uF417
set -x tag_glyph 				\uF412
  	

function fish_title
  if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
  	set -l IFS .
  	hostname | read -l hostname __	
  	
  	if git_is_repo
			set cwd (basename (prompt_pwd))	
			set rocket_glyph ' - 🚀'
			set branch (git_branch_name)
			set git_info "$rocket_glyph $cwd"
		end 	

  	echo -ns (whoami) '@' $hostname ' ' $git_info
  end
end
