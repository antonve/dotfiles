# Case-insensitive globbing (used in pathname expansion)
setopt NO_CASE_GLOB

# Automatically CD into directory even when forgetting to cd
setopt AUTO_CD

## HISTORY
# Add timestamps to the history
setopt EXTENDED_HISTORY

# Don't overwrite, but append to the history file
setopt APPEND_HISTORY

# Share history between different sessions
setopt SHARE_HISTORY

# Expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 

# Do not store duplications
setopt HIST_IGNORE_DUPS

# Ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# Removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Autocorrect typos
setopt CORRECT
setopt CORRECT_ALL

# Turn on auto completion
autoload -Uz compinit && compinit

# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Use vim key bindings
bindkey -v