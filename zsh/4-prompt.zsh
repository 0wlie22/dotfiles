RETVAL=$?

setopt prompt_subst

autoload -Uz add-zsh-hook
add-zsh-hook precmd git-info

# Colors
PARENTHESES=110
PATHWAY=32
GIT_BRANCH=141
GIT_BRANCH_CHANGES=197
VENV_COLOR=111

RED=161
GRAY=244
YELLOW=214
prompt_segments=''  


_path_segment() 
    prompt_segments+='%F{$PARENTHESES}[%f%F{$PATHWAY}%~%f%F{$PARENTHESES}]%f'

status_segment() {  
	local segment=
	if (( $RETVAL )) segment+=' %F{$RED}%f ' 
	if (( EUID == 0 )) segment+=' %F{yellow}⚡%f '
	if (( $(jobs -l | wc -l) )) segment+=' %F{cyan}⚙%f '
	if (( RANGER_LEVEL )) segment+=' %F{cyan}r'
	if [[ -n ${VIRTUAL_ENV} ]]	segment+='%F{$VENV_COLOR}VENV: ${VIRTUAL_ENV:t}%f '
	if [[ -n ${SSH_TTY} ]] segment+=' %F{%(!.yellow.default)}%n@%m%f'
	if [[ -n ${segment} ]]; then
	  prompt_segments+="${segment}"
	fi
}

_git_segment() {
	#git_color=
	#git_dirty=${(e)git_info[dirty]}
	#if [[ -n ${git_dirty} ]]; then
	  #git_color=$GIT_BRANCH
      #else
	  #git_color=$GIT_BRANCH_CHANGES
	#fi
	prompt_segments+='%F{$GIT_BRANCH}${(e)git_info[prompt]}${(e)git_info[dirty]}%f '
}

_end_segment() 
	prompt_segments+="%F{$GRAY}%f "

typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

status_segment  
_path_segment

typeset -gA git_info
if (( ${+functions[git-info]} )); then
	zstyle ':zim:git-info:branch' format '  %b'
	zstyle ':zim:git-info:commit' format ' %F{139}➦ %c%f'
	zstyle ':zim:git-info:action' format ' %F{139}(%s)%f'
	zstyle ':zim:git-info:dirty' format ' %F{$RED}%f'
	zstyle ':zim:git-info:keys' format 'prompt' '%b%c%s' 'dirty' '%D'
	_git_segment
fi

_end_segment

PROMPT=$prompt_segments 
RPROMPT=$'%F{$RED}%(?..%?)%f'


