#!/bin/bash

set -e
set -u

find . -name '*.eml' | while read filename; do
  message_id=$(\
    grep "Message-ID:" "${filename}" | \
      sed -E "s/Message-ID: <([0-9]+)\.([0-9]+)\.([0-9]+)@stash.internal.forgerock.com>/\3-\1.\2/" \
  )

  base_target_dir_name=$(dirname "${filename}" | sed -E 's!^./messages/!attachments/!')
  target_dir_name="${base_target_dir_name}/${message_id}"

  mkdir -p "${target_dir_name}"

  munpack -t -f "${filename}"
  mv part1 "${target_dir_name}/${message_id}.html"
  
  rm part*
done