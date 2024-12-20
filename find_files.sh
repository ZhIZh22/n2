#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Пожалуйста, укажите директорию и расширение файлов."
  exit 1
fi

dir_path="$1"
extension="$2"

if [ ! -d "$dir_path" ]; then
  echo "Директория не найдена."
  exit 1
fi

find "$dir_path" -type f -name "*.$extension" -print0 | while IFS= read -r -d $'\0' file; do
  files_found=true
  echo "$file"
done

if [ -z "$files_found" ]; then
  echo "Файлы с расширением $extension не найдены."
fi
