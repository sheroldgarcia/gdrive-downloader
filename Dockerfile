# Dockerfile
FROM ubuntu:noble

# Instalamos dependencias necesarias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Creamos un entorno virtual para instalar gdown
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Instalamos gdown en el entorno virtual
RUN pip install gdown

# Creamos los directorios de configuración y datos
RUN mkdir -p /configs/gdrive /data

# Copiamos los archivos necesarios
COPY configs/gdrive/download_list.txt /configs/gdrive/download_list.txt

# Directorio de trabajo
WORKDIR /

# Script de descarga simplificado
COPY download_gdrive.sh /download_gdrive.sh
RUN chmod +x /download_gdrive.sh

# Comando de ejecución
CMD ["/download_gdrive.sh"]
