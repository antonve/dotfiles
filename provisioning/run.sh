#!/usr/bin/env bash

set -Eeuo pipefail

cd "$(dirname $0)"

CMD=('ansible-playbook')
ARGS=('')
for a in "$@"; do
  ARGS=(${ARGS[@]} "$a")
done

${CMD[@]} \
  -i 'localhost,' \
  --extra-vars='@config.yml' \
  ${ARGS[@]} \
  playbook.yml