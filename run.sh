#!/bin/bash

# Cek apakah figlet sudah terinstall, jika belum maka install figlet
if ! command -v figlet &> /dev/null; then
  echo "Figlet belum terinstall, menginstall figlet ..."
  echo ""
  apt update
  apt install figlet -y
  echo ""
fi

# Nama figlet
echo ""
echo ""
figlet -f slant "WebDav Uploader"
echo ""
echo ""

# Masukkan nama file yang akan diupload
read -p "Masukkan nama file yang akan diupload: " filename
echo ""

# Cek apakah file yang dimaksud ada atau tidak
if [ -f "/sdcard/$filename" ]; then
  echo "Uploading file $filename ..."
  echo ""
  # Baca file target.txt dan upload file dengan curl
  while IFS= read -r url; do
    echo "Uploading to: $url"
    result=$(curl -s -T "/sdcard/$filename" "$url" --max-time 10 --write-out "%{http_code}\n" --silent --output /dev/null)
    if [ $result -eq 201 ] || [ $result -eq 204 ] || [ $result -eq 200 ]; then
      echo -e "\e[32mUpload berhasil ke $url\e[0m"
      echo ""
    else
      echo -e "\e[31mUpload gagal ke $url\e[0m"
      echo ""
    fi
  done < target.txt
else
  echo "File tidak ditemukan!"
fi
