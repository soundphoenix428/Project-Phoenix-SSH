#!/Bin/Bash
set -e
echo -e "\e[32m
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#              Project Phoenix Script                   #
#       This Script only works on Ubuntu & Debian       #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #\e[0m"

# Check if user is sudo
if [[ $EUITD -ne 0 ]]; then
    echo -e "\e{32m* Project Phoenix must be executed via sudo user. \e[0m" 1>&2
    exit 1
fi

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
echo -e "\e[32m* Installing dependencies..\3[0m"
sudo apt update > /dev/null 2>&1

#Install Curl and NPM
if ! [ -x "$(command -v curl)" ]; then
echo -e "\e[32m* Installing curl...\e[0m"
sudo apt install -y curl > /dev/null 2>&1
fi

# Install NPM 
if ! [ -x "$(command -v npm)" ]; then
echo -e "\e[32m* Installing NPM...\e[0m"
sudo apt install -y npm > /dev/null 2>&1
fi 

# Install Wget
if ! [ -x "$(command -v wget)" ]; then
echo -e "\e[32m* Installing wget...\e[0m"
sudo apt install -y wget > /dev/null 2>&1
fi

# Install Java
if ! [ -x "$(command -v javac)" ]; then
echo -e "\e[32m* Installing java...\e[0m"
sudo apt install -y default-jdk > /dev/null 2>&1
fi

# Install Pm2
if ! [ -x "$(command -v pm2)" ]; then
echo -e "\e[32m* Installing pm2...\e[0m"
sudo npm install pm2 -g > /dev/null 2>&1
fi

# Start Project Phoenix
sudo pm2 start ~/Project Phoenix/config.json --name "Project Phoenix"
sudo pm2 startup
sudo pm2 save
