# General
# ============================================

# Change to project root folder
cdrt() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `git rev-parse --show-toplevel`
  fi
}

# Make directory and change into it
mkd() {
  mkdir -p "$@" && cd "$@"
}

# Reload shell
reload() {
  exec zsh -l
  [ -n "$TMUX" ] && tmux source-file ~/.tmux.conf
}

# Which + edit
whiche() {
  local file="$(which $1)"
  if [ -f "$file" ]; then
    vim "$file"
  else
    echo "$file"
  fi
}

# Open xcode project
openx() {
  if [ -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)" ]; then
    echo 'Opening workspace...'
    open *.xcworkspace
  elif [ -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)" ]; then
    echo 'Opening project...'
    open *.xcodeproj
  else
    echo 'Nothing found'
    exit 1
  fi
}

# Tmux
# ============================================

# Kill all non-attached sessions
tmk() {
  tmux ls \
    | grep -v attached \
    | cut -d: -f 1 \
    | xargs -n 1 tmux kill-session -t
}