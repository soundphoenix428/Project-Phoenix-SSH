#!/Bin/Bash
set -e
echo -e "\e[32m
 ************************************************
 *     Project Phoenix Stastistic Script        *
 ************************************************\e[0m"
# Welcome the user to the script 
echo Welcome to the Project Phoenix Script 
while true; do
RESET="/e[0m"
GREEN="e[32m"
read -p "$(echo -e $GREEN"\n* Proceed? (Y/N)"$RESET)" yn
case $yn in
[yY] ) echo -e "\e[32m* Confirmed. Continuing..\e[0m";
break;;
[nN] ) echo -e "\e[32m* Confirmed. Exiting...\e[0m";
exit;;
* ) echo -e "\3[32m* Invalid Response.\3[0m";;
esac
done

