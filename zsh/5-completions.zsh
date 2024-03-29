# Add custom completion directory to fpath
unset fpath
local -a completions
completions=(
    /opt/homebrew/share/zsh/site-functions
    /opt/homebrew/share/zsh/functions
    $HOME/.local/share/zsh/site-functions
    $ZSH_CONFIG_DIR/functions
)
for dir in $completions; do
    fpath+=$dir
done
unset completions

# Enable completion features
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
zstyle ':complition:*:*:*:*:*' menu select
zstyle ':complition:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case insensitive tab complition
zstyle ':complition:*' list-colors "${(s.:.)LS_COLORS}" 	# Take advantage of $LS_COLORS for completion as well
# zstyle ':completion:*:*:docker:*' option-stacking yes
# zstyle ':completion:*:*:docker-*:*' option-stacking yes

# # kubectl certificate manager completion
if command -v cmctl >/dev/null; then
    cmctl completion zsh > $HOME/.local/share/zsh/site-functions/_cmctl
fi

# terraform completion
if command -v terraform >/dev/null; then
    complete -o nospace -C $(which terraform) terraform
fi

# # 1passowrd-cli completion
# if command -v op >/dev/null; then
#     eval "$(op completion zsh)"
#     compdef _op op
# fi

#compdef localstack

_localstack_completion() {
    local -a completions
    local -a completions_with_descriptions
    local -a response
    (( ! $+commands[localstack] )) && return 1

    response=("${(@f)$(env COMP_WORDS="${words[*]}" COMP_CWORD=$((CURRENT-1)) _LOCALSTACK_COMPLETE=zsh_complete localstack)}")

    for type key descr in ${response}; do
        if [[ "$type" == "plain" ]]; then
            if [[ "$descr" == "_" ]]; then
                completions+=("$key")
            else
                completions_with_descriptions+=("$key":"$descr")
            fi
        elif [[ "$type" == "dir" ]]; then
            _path_files -/
        elif [[ "$type" == "file" ]]; then
            _path_files -f
        fi
    done

    if [ -n "$completions_with_descriptions" ]; then
        _describe -V unsorted completions_with_descriptions -U
    fi

    if [ -n "$completions" ]; then
        compadd -U -V unsorted -a completions
    fi
}

if [[ $zsh_eval_context[-1] == loadautofunc ]]; then
    # autoload from fpath, call function directly
    _localstack_completion "$@"
else
    # eval/source/. command, register function for later
    compdef _localstack_completion localstack
fi
