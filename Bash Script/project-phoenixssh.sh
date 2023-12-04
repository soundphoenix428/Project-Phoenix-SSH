#!/Bin/Bash
set -e
echo -e "\e[32m
██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗
██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝
██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║   
██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║   
██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║   
╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝   
██████╗ ██╗  ██╗ ██████╗ ███████╗███╗   ██╗██╗██╗  ██╗    
██╔══██╗██║  ██║██╔═══██╗██╔════╝████╗  ██║██║╚██╗██╔╝    
██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██║ ╚███╔╝     
██╔═══╝ ██╔══██║██║   ██║██╔══╝  ██║╚██╗██║██║ ██╔██╗     
██║     ██║  ██║╚██████╔╝███████╗██║ ╚████║██║██╔╝ ██╗    
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝    
                                                          \e[0m"

# Check if user is sudo
if [[ $EUITD -ne 0 ]]; then
    echo -e "\e{32m* Project Phoenix must be executed via sudo user. \e[0m" 1>&2
    exit 1
fi

# Proceed ?
while = true do;
RESET="\e[0"
GREEN="\e[32"

read -p "$(echo -e $GREEN"\n* Project Phoenix is starting..."$RESET)"

read -p "$(echo -e $GREEN"\n* Do you want to proceed? (Y/N)"$RESET)" yn
case $yn in
[yY] ) echo -e "\e[32m* Confirmed. Continuing..\e[0m";
break;;
[nN] ) echo -e "\e[32m* Confirmed. Exiting Installation..\e[0m";
exit;;
* ) echo -e "\3[32m* Invalid Response.\3[0m";;
esac
done
echo -e "\e[32m* Installing dependencies...\3[0m"

# Install Curl
if ! [ -x "$(command -v curl)" ]; then
echo -e "\e[32m* Installing curl.\e[0m"
sudo apt install -y curl > /dev/null 2>&1
fi

# Install NodeJS
if ! [ -x "$(command -v node)" ]; then
echo -e "\e[32m* Installing NodeJS\e[0m"
echo -e "\e[32m* Which NodeJS version would you like to install? []\e[0m"
read NodeJSVer
if [[ -n "NodeJSVer" ]]
then
in=$NodeJSVer
fi
echo -e "\e[32m* Installing NodeJS: $in \e[0m"
curl -sL https://deb.nodesource.com/setup_$in.x | sudo -E bash - > /dev/null 2>&1 && sudo apt install -y nodejs > /dev/null 2>&1
fi

# Install NPM 
if ! [ -x "$(command -v npm)" ]; then
echo -e "\e[32m* Installing NPM...\e[0m"
sudo apt install -y npm > /dev/null 2>&1
fi

# Install Wget
if ! [ -x "$(command -v wget)" ]; then
echo -e "\e[32m* Installing wget.\e[0m"
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

# Let user know Installation is complete
echo -e "\e[32m* Installation Complete. \e[0m"
echo -e "\e[32m* Would you like to see all avalible commands? [Y/N]. \e[0m"
case $yn in 
[yY] ) echo -e "\e[32m* Confirmed. Continuing..\e[0m";
break;;
[nN] ) echo -e "\e[32m* Confirmed. Exiting...\e[0m";
exit;;
* ) echo -e "\e[32m* Invalid Response.\3[0";;
esac 
done
echo -e  "\e[32m* All Avalible commands:
Help-Runs help command
Exit-Runs help command
Upload-Uploads files to Project Phoenx's Pterodactyl pannel via upload
Info-Shows info 
Uname-Shows OS name"
read -p "$(echo -e $GREEN"\n* PLEASE NOTE ALL COMMANDS ARE NOT YET CODED!"$RESET)"
read -p "$(echo -e $GREEN"\n* Exiting Project Phoenix..."$RESET)"
exit;;
