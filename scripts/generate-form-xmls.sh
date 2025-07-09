#!/bin/bash -eu
set -o pipefail

log() { echo >&2 "[generate-form-xmls] $*"; }

generateXml() {
  local src=$1
  local tgt="$src.xml"
  log "  Processing: $src ..."
  xls2xform --pretty_print "$src" "$tgt"
  log "    XML generated at: $tgt"
}

log "Generating XML files..."
generateXml ./OccTaxODK.xlsx
log "XML generation completed."
