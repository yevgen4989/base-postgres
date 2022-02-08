#!/bin/bash

set -e

versions=('9.6' '10' '11' '12' '13' '14' '15')
for ver in "${versions[@]}"; do
  cp ${ver}/alpine/Dockerfile ${ver}/alpine/Dockerfile.template

  # Change basic image.
  sed -i '/FROM alpine/i\ARG BASE_IMAGE_TAG\n' ${ver}/alpine/Dockerfile.template
  sed -i 's/FROM alpine.*/FROM yevgen4989\/alpine:${BASE_IMAGE_TAG}/' ${ver}/alpine/Dockerfile.template
  # Alpine 3.15 has older version of llvm.
  sed -i 's/llvm11/llvm10/' ${ver}/alpine/Dockerfile.template

  fullVersion=$(grep -oP '(?<=^ENV PG_VERSION )([0-9\.]+)' ${ver}/alpine/Dockerfile.template)
  minorVersion=$(echo "${fullVersion}" | sed -E 's/.[0-9]+$$//')

  # Update gh workflow
  sed -i -E "s/(version): '${minorVersion//\./\\.}\.[0-9]+'/\1: '${fullVersion}'/" .github/workflows/workflow.yml
  sed -i -E "s/(tags): ${minorVersion//\./\\.}\.[0-9]+/\1: ${fullVersion}/" .github/workflows/workflow.yml
  # Update README.
  sed -i -E "s/\`${minorVersion//\./\\.}\.[0-9]+\`/\`${fullVersion}\`/" README.md
done