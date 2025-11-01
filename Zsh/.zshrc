#Install Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/amro.omp.json)"
fpath+=${ZDOTDIR:-~}/.zsh_functions

addToPathFront() {
  export PATH="$1:$PATH"
}
addToPathBack() {
  export PATH="$PATH:$1"
}

# GO
addToPathBack /usr/local/go/bin
addToPathBack $(go env GOPATH)/bin
# asdf
addToPathBack "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"

export WORKON_HOME=~/Envs
source ~/.local/bin/virtualenvwrapper.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


eval "$(zoxide init --cmd cd zsh)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && addToPathBack "$PYENV_ROOT/bin"
eval "$(pyenv init -)"


# force C colored diagnostic output
export CFLAGS="${CFLAGS} -fdiagnostics-color=always"
export CXXFLAGS="${CXXFLAGS} -fdiagnostics-color=always"
export CCFLAGS="${CCFLAGS} -fdiagnostics-color=always"
export CPPFLAGS="${CPPFLAGS} -fdiagnostics-color=always"


if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
