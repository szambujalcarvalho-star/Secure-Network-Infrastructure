#!/bin/bash
# Build da imagem Kathara 'redvector/snort'.
#
# Usado pela VM 'ids' do laboratorio (ver lab.conf).
# Executar uma vez, antes do primeiro 'kathara lstart'.
#
# Pre-requisitos: docker instalado e a correr no host.

set -e

cd "$(dirname "$0")"

echo "[build-snort] Pulling base image xtrm0/quagga..."
docker pull xtrm0/quagga

echo "[build-snort] Building redvector/snort..."
docker build -f Dockerfile.snort -t redvector/snort .

echo "[build-snort] Done. Imagem 'redvector/snort' pronta a ser usada no lab.conf."
docker images | grep -E "REPOSITORY|redvector/snort|xtrm0/quagga"
