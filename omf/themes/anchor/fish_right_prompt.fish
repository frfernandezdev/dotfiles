function fish_right_prompt
	set -l yellow (set_color -o yellow)
	if test $CMD_DURATION -gt 1000
		set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.0fs", $1 / $2}')
    	echo -n -s "$yellow took $duration"
  	end
end

