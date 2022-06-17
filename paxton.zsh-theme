# Paxton's Theme - https://github.com/p1xt4n/ohmyzsh-theme-paxton/


right_triangle() {
   echo $'\ue0b0'
}

prompt_indicator() {
   echo ""
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

ok_current_time() {
   ARROW_FG="016"
   ARROW_BG="015"
   NEXT_ARROW_BG="027"
   NEXT_ARROW_FG="015"
   echo "$(arrow_start) %* $(arrow_end)"
}

err_current_time() {
   ARROW_FG="016"
   ARROW_BG="160"
   NEXT_ARROW_BG="027"
   NEXT_ARROW_FG="160"
   echo "$(arrow_start) %* $(arrow_end)"
}

current_time() {
   echo "%(?.$(ok_current_time).$(err_current_time))"
}

directory() {
   ARROW_FG="016"
   ARROW_BG="027"
   NEXT_ARROW_BG="045"
   NEXT_ARROW_FG="027"
   echo "$(arrow_start) %c $(arrow_end)"
}

git_prompt() {
   ARROW_FG="016"
   ARROW_BG="045"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="045"
   echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$(current_time)$(directory)$(git_prompt) $(prompt_indicator)'
