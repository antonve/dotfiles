export ANYENV_DIR=$HOME/.anyenv

export PATH=$ANYENV_DIR/bin:$PATH

if [ -z "$SKIP_ANYENV_INIT" ] && [ -d "$HOME/.anyenv" ] && command -v 'anyenv' > /dev/null 2>&1; then
  eval "$(anyenv init - --no-rehash)"
  (anyenv rehash &) 2> /dev/null # Lazy rehashing
fi
