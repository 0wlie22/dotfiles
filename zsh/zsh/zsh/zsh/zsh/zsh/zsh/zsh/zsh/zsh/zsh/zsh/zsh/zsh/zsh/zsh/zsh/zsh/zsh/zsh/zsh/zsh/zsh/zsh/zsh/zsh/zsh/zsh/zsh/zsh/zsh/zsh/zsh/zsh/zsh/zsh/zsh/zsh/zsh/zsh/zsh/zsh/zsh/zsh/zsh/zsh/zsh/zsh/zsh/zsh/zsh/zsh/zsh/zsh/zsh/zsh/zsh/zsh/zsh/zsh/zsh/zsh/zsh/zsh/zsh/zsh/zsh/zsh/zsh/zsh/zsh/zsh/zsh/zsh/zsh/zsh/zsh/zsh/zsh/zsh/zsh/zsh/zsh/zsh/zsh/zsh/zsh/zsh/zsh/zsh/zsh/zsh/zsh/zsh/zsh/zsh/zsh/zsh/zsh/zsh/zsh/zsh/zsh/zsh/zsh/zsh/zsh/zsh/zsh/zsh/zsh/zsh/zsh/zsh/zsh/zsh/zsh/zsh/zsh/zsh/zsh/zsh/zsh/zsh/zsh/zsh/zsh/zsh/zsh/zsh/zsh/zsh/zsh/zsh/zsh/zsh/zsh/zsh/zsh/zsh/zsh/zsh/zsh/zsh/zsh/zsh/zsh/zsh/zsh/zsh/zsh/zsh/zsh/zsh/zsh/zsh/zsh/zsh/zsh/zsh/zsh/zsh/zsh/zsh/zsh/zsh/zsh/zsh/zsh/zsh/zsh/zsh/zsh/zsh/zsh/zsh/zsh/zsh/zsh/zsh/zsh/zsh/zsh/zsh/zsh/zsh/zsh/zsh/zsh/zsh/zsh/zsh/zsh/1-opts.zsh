HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999

setopt hist_verify
setopt append_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups

setopt autocd		# cd if "command" is a directory
setopt autolist		# automatically list choises on an ambiguouse completion
setopt extendedglob	# treat the # ~ ^ as part of patterns for filename generation
setopt notify		# report the status of background jobs immediately
# setopt nocorrectall	# do not correct commands and arguments
setopt nobeep		# disable beep
setopt autopushd	# make cd push the old dir onto the dir stack
setopt pushdminus	# exchanges the meanings of + and - when used with a number to specify a dir in the stack
setopt pushdignoredups	# don't push multiple copies of the same dir onto the dir stack
setopt longlistjobs	# print job notifications in the long format by default
setopt nohup		# do not send HUP (Hang UP) signal to running jobs on exit
