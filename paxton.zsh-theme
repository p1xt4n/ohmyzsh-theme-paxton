# Paxton's Theme - https://github.com/p1xt4n/ohmyzsh-theme-paxton/


right_triangle() {
   echo $'\ue0b0'
}

prompt_indicator() {
   # echo $'%B\u276f%b'
   echo ""
   #echo "%{$fg_bold[red]%}❱%{$fg_bold[yellow]%}❱%{$fg_bold[green]%}❱"
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

ok_current_time() {
   ARROW_FG="016" #016, color word
   ARROW_BG="012"
   NEXT_ARROW_BG="178" #027
   NEXT_ARROW_FG="012" #015
   echo "$(arrow_start) %* $(arrow_end)"
}

err_current_time() {
   ARROW_FG="016"
   ARROW_BG="160"
   NEXT_ARROW_BG="178" #027
   NEXT_ARROW_FG="160"
   echo "$(arrow_start) %* $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
current_time() {
   echo "%(?.$(ok_current_time).$(err_current_time))"
}

directory() {
   #ARROW_FG="016"
   #ARROW_BG="183"
   #NEXT_ARROW_BG="139"
   #NEXT_ARROW_FG="183"

   ARROW_FG="016" # word color
   ARROW_BG="178" #027, background color
   NEXT_ARROW_BG="070" # 045, background righ arrow
   NEXT_ARROW_FG="178" # 027, righ arrow

   #echo "$(arrow_start) ${PWD##*/} $(arrow_end)"
   echo "$(arrow_start) %c $(arrow_end)"
}

git_prompt() {
   ARROW_FG="016"
   ARROW_BG="070" #045
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="070" # 045
   echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='$(current_time)$(directory)$(git_prompt) $(prompt_indicator)'
