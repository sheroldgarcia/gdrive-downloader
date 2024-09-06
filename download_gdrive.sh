#!/bin/bash

# Leer la lista de IDs de archivos desde download_list.txt y descargarlos
while IFS= read -r file_id; do
    if [ -n "$file_id" ]; then
        echo "Descargando archivo con ID: $file_id"
        gdown --id "$file_id" -O /data
    fi
done < /configs/gdrive/download_list.txt

