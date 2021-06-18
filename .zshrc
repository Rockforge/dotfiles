source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

#antigen theme robbyrussell
#antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen theme jackharrisonsherlock/common

antigen apply

# User configuration
export PATH=$HOME/.local/bin:$PATH

export TERM="xterm-256color"

export EDITOR='nvim'

export VISUAL='nvim'

export XDEBUG_CONFIG="idekey=VSCODE"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

if [ -f $HOME/.aliases_work ]; then
    source $HOME/.aliases_work
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

