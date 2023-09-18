#!/bin/bash

# Diretório base (onde o diretório de vídeos está localizado em relação ao script)
BASE_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

# Diretório de origem dos vídeos
SOURCE_DIR="$BASE_DIR/videos"

# Verificar se o diretório 'frames' existe. Se não, criar.
if [ ! -d "$BASE_DIR/frames" ]; then
    mkdir "$BASE_DIR/frames"
fi

# Loop através de cada arquivo de vídeo no diretório de origem
for VIDEO_FILE in "$SOURCE_DIR"/*.{mp4,avi,mkv}; do
    # Ignorar se nenhum arquivo de um determinado tipo for encontrado
    if [ ! -f "$VIDEO_FILE" ]; then
        continue
    fi

    # Obter o nome base do arquivo de vídeo (sem extensão)
    BASENAME=$(basename "$VIDEO_FILE")
    NAME_NO_EXT="${BASENAME%.*}"

    # Diretório de destino para os frames do vídeo atual
    DEST_DIR="$BASE_DIR/frames/$NAME_NO_EXT"

    # Criar diretório de destino se não existir
    if [ ! -d "$DEST_DIR" ]; then
        mkdir "$DEST_DIR"
    fi

    # Usar ffmpeg para extrair frames e salvar como PNG no diretório de destino
    ffmpeg -i "$VIDEO_FILE" "$DEST_DIR/%09d.png"
done

echo "Extração concluída!"

