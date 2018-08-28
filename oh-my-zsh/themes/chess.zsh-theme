SESSION_TYPE=host

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

if [ "$SESSION_TYPE" = "remote/ssh" ]; then
  AESTHETIC='%(!.♝.♕)'
else
  AESTHETIC='%(!.♞.♘)'
fi

# CMDPROMPT='%(!.#.$)'

PROMPT='%{$FG[154]%}%c$(git_prompt_info) %{$FG[003]%}% %{$FG[045]%}'$AESTHETIC'%{$reset_color%}  '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[062]%} [%{$FG[015]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[062]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

export LSCOLORS="Gxfxahabbxegedabagacad"
export LS_COLORS='di=1;36:ln=35:so=30;47:pi=30;41:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

