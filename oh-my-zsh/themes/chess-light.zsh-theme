SESSION_TYPE=host

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

if [ "$SESSION_TYPE" = "remote/ssh" ]; then
  AESTHETIC="$(hostname) %(!.♝.♕)"
else
  AESTHETIC="%(!.♞.♞)"
fi


# NOTE: run `spectrum_ls` to see all available colors
# CMDPROMPT='%(!.#.$)'

PROMPT='%B%{$FG[045]%}%c$(git_prompt_info) %B%{$FG[088]%}% %B%{$FG[196]%}'$AESTHETIC'%{$reset_color%}  '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[062]%} [%{$FG[01f]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[062]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

export LSCOLORS="exfxfxfxcxegedabagacad"
export LS_COLORS='di=34:ln=35:so=35:pi=35:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

