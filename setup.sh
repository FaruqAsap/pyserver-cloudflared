#!/bin/bash

ZIP_URL="https://raw.githubusercontent.com/FaruqAsap/pyserver-cloudflared/main/base.zip"
ZIP_FILE="base.zip"

echo "Mengunduh file dari GitHub..."
wget -qO $ZIP_FILE $ZIP_URL

echo "Mengekstrak file..."
unzip -o $ZIP_FILE && rm -f $ZIP_FILE

if ! command -v python3 &>/dev/null; then
    echo "Python tidak ditemukan, menginstal Python..."
    if command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y python3 python3-pip
    elif command -v apk &>/dev/null; then
        sudo apk add --no-cache python3 py3-pip
    elif command -v yum &>/dev/null; then
        sudo yum install -y python3 python3-pip
    else
        echo "Paket manager tidak dikenali. Instal Python secara manual."
        exit 1
    fi
fi

if [ -f "requirements.txt" ]; then
    echo "Menginstal dependensi dari requirements.txt..."
    pip3 install -r requirements.txt
else
    echo "requirements.txt tidak ditemukan, melewati instalasi dependensi..."
fi

echo "Menginstal Cloudflared..."
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared.deb
rm -f cloudflared.deb

read -p "Masukkan token Cloudflared: " CF_TOKEN

echo "Menginstal token Cloudflared..."
sudo cloudflared service install "$CF_TOKEN"

echo "Setup selesai! Cloudflared telah dikonfigurasi."
