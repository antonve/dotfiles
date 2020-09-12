# PROMPT
autoload -U promptinit; promptinit
prompt pure

# Show git in prompt
zstyle :prompt:pure:git:stash show yes

# Set color for path in prompt
zstyle :prompt:pure:path color blue

# Don't error on comments
setopt interactivecomments

# Automatically push the directory to the directory stack when using `cd`
setopt auto_pushd