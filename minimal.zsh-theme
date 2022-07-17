ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function repository_name() {
   echo "$(basename `git rev-parse --show-toplevel`)"
}

function working_directory() {
    if [[ $(git rev-parse --is-inside-work-tree 2>&1) == 'true' ]]
    then
        echo "$(repository_name)/$(git rev-parse --show-prefix 2>&1) "
    else
	echo "%2~" 
    fi
}

function git_info() {
    echo "%{$FG[208]%}$(git_prompt_info)%{$reset_color%}"
}
function precmd() {
    PROMPT="🐱%n 📁$(working_directory)$(git_info) ❯ "
}

PROMPT="🐱%n 📁$(working_directory)$(git_info) ❯ "

