#!/bin/bash -eu
set -o pipefail

log() { echo >&2 "[check-for-changes] $*"; }

log "Checking git status..."
status="$(git status --porcelain)"

if [[ "$status" = "" ]]; then
  log "Everything looks OK."
else
  echo
  git diff
  echo

  log "!!!"
  log "!!! There are changes in generated form XMLs - please see above for"
  log "!!! details."
  log "!!!"
  log "!!! To aid tracking changes, form XMLs should be updated in git when the"
  log "!!! underlying .xls/.xlsx file is changed."
  log "!!!"
  log "!!! Please run the following command locally:"
  log "!!!"
  log "!!!   ./scripts/generate-form-xmls.sh && git add . && git commit"
  log "!!!"
  log "!!! ...and then push changes to this branch."
  log "!!!"
  exit 1
fi
