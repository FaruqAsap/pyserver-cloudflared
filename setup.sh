#!/bin/bash

REPO_URL="https://github.com/user/repo/archive/refs/heads/main.zip"
ZIP_FILE="/tmp/repo.zip"

echo "Mengunduh file dari GitHub..."
wget -qO $ZIP_FILE $REPO_URL

echo "Mengekstrak file..."
unzip -o $ZIP_FILE -d /tmp/ && mv /tmp/repo-main/* . && rm -rf /tmp/repo-main

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

echo "Setup selesai!"
