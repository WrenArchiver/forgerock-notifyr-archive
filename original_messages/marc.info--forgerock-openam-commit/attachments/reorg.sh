#!/bin/bash
dirs=$(find . -mindepth 2 -maxdepth 2)

for dir in ${dirs[@]}; do
  dirname=$(dirname "${dir}")
  basename=$(basename "${dir}")

  swapped_basename=$(\
    echo "$basename" | \
      cut -d'.' -f1-3 --output-delimiter=' ' | \
      awk '{ print $3 "-" $1 "." $2 }' \
  )

  echo "== Rename =="
  echo "From: ${basename}"
  echo "To: ${swapped_basename}"
  
  mv "${dirname}/${basename}" "${dirname}/${swapped_basename}"
done