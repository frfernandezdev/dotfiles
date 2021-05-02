# name: Anchor
# You can override some default options in your config.fish:
#   set -g theme_display_git_untracked no

set -x anchor_glyph 		\u2693
set -x branch_glyph 		\uF418
set -x detached_glyph 	\uF417
set -x tag_glyph 				\uF412

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -g red (set_color -o red)
  set -g blue (set_color -o blue)
  set -l green (set_color -o green)
  set -g normal (set_color normal)

  set -l ahead (_git_ahead)
  set -g whitespace ' '

  if test $last_status = 0
    set initial_indicator "$green◆"
  else
    set initial_indicator "$red✖ $last_status"
  end
  set -l cwd $cyan(basename (prompt_pwd))
	
  if git_is_repo
  	if [ (_git_branch_name) ]   
		set -l git_branch (_git_branch_name)
			set git_info "$normal on "
	    
	    if git_is_dirty and git_untracked
				set -l dirty "$red$git_branch ✗"
		    set git_info "$git_info$dirty"
    	else if git_is_staged
				set -l dirty "$cyan$git_branch ✔"
		 		set git_info "$git_info$dirty"
	  	else if git_is_stashed
				set -l dirty "$green$git_branch 💾"
				set git_info "$git_info$dirty"
	  	else 
				set git_info "$git_info$git_branch"
	  	end	
		end
  end
  echo -n -s $initial_indicator $whitespace $cwd $git_info $whitespace $ahead $anchor_glyph $whitespace
end

function _git_ahead
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' ^/dev/null)
  if [ $status != 0 ]
    return
  end
  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
  switch "$ahead $behind"
    case ''     # no upstream
    case '0 0'  # equal to upstream
      return
    case '* 0'  # ahead of upstream
      echo "$blue↑$normal_c$ahead$whitespace"
    case '0 *'  # behind upstream
      echo "$red↓$normal_c$behind$whitespace"
    case '*'    # diverged from upstream
      echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
  end
end

function _git_branch_name
  set -l branch (command git symbolic-ref HEAD 2>/dev/null | string replace -r '^refs/heads/' '')
  and echo "$branch_glyph $branch"
  and return 
  
  set -l tag (command git describe --tags --exact-match 2>/dev/null)
  and echo "$tag_glyph $tag"
  and return
  
  set -l branch (command git show-ref --head -s --abbrev | head -n1 2>/dev/null)
  echo "$detached_glyph $branch"
end
