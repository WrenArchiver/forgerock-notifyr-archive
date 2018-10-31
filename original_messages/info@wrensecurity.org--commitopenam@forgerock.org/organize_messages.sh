#!/bin/bash
for file in *.eml; do 
  new_filename=$(\
    echo "${file}" | \
      sed -E 's!(.*) - ([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{4})!messages/\2/\3 - \1!'
  )
  
  target_dir=$(dirname "${new_filename}")

  mkdir -p "${target_dir}"
  
  mv "${file}" "${new_filename}"
done