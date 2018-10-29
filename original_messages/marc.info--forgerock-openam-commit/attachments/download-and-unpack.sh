#!/bin/bash
message_id="${1}"
mime_filename="${message_id}.mime"

curl -o "${mime_filename}" "https://marc.info/?l=forgerock-openam-commit&m=${message_id}&q=raw"
munpack -t -f "${mime_filename}" && mv part1 "${message_id}.html"
