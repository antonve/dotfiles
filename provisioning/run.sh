#!/usr/bin/env bash

set -Eeuo pipefail

cd "$(dirname $0)"

CMD=('ansible-playbook')
ARGS=('')
for a in "$@"; do
  ARGS=(${ARGS[@]} "$a")
done

if ! [ -f ./secrets.yml ]; then
  cp ./secrets{.sample,}.yml
  [ "${DOTFILES_NOEDIT_SECRETS:-0}" -eq 0 ] && vim ./secrets.yml
fi

${CMD[@]} \
  -i 'localhost,' \
  --extra-vars='@config.yml' \
  --extra-vars='@secrets.yml' \
  ${ARGS[@]} \
  playbook.yml