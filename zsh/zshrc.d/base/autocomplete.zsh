# HISTORY
# ============================================

# Add timestamps to the history
setopt extended_history

# Don't overwrite, but append to the history file
setopt append_history

# Share history between different sessions
setopt share_history

# Expire duplicates first
setopt hist_expire_dups_first

# Do not store duplications
setopt hist_ignore_dups

# Ignore duplicates when searching
setopt hist_find_no_dups

# Removes blank lines from history
setopt hist_reduce_blanks

# AUTO COMPLETE
# ============================================

# Autocorrect typos
setopt nocorrectall
setopt correct

# Turn on auto completion
autoload -Uz compinit && compinit

# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Use vim key bindings
bindkey -v

# Autocomplete in brackets
setopt auto_param_keys

# Expand ranges
setopt brace_ccl

# Case-insensitive globbing (used in pathname expansion)
setopt no_case_glob

# If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory,
# and does not begin with a slash, try to expand the expression as if it were preceded by a ‘~’
setopt cdable_vars
