# LOAD
# ============================================

source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath=(
  ~/dotfiles/zsh/plugins/zsh-completions/src
  $fpath
)

fpath+=("$(brew --prefix)/share/zsh/site-functions")

# PROMPT
# ============================================
autoload -U promptinit; promptinit
prompt pure

# Show git in prompt
zstyle :prompt:pure:git:stash show yes

# Set color for path in prompt
zstyle :prompt:pure:path color blue

# NAVIGATION
# ============================================

# Automatically CD into directory even when forgetting to cd
setopt auto_cd

# Pushd configuration
# Automatically push the directory to the directory stack when using `cd`
setopt auto_pushd
# Ignore duplicates
setopt pushd_ignore_dups

# Don't error on comments
setopt interactivecomments

# ETC
# ============================================

# Disable beep sounds
setopt nolistbeep
setopt no_beep
