#!/bin/bash
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 6`
RESET=`tput sgr0`
echo "██████╗  █████╗ ██████╗ ██╗    ███╗   ███╗███████╗██╗  ██╗██████╗ ██╗███████╗███████╗"
echo "██╔══██╗██╔══██╗██╔══██╗██║    ████╗ ████║██╔════╝██║  ██║██╔══██╗██║╚════██║╚════██║"
echo "██████╔╝███████║██████╔╝██║    ██╔████╔██║█████╗  ███████║██║  ██║██║   ██╔╝    ██╔╝"
echo "██╔══██╗██╔══██║██╔══██╗██║    ██║╚██╔╝██║██╔══╝  ██╔══██║██║  ██║██║  ██╔╝    ██╔╝"
echo "██████╔╝██║  ██║██║  ██║██║    ██║ ╚═╝ ██║███████╗██║  ██║██████╔╝██║  ██║     ██║"
echo "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═╝"
echo "${RED}Updating The System${RESET}"
# sudo apt-get update -y
echo "${RED}Installing ${BLUE}openssh${RESET}"
# sudo apt install openssh-server -y
echo "${RED}Installing ${BLUE}git${RESET}"
# sudo apt install git -y
echo "${RED}Installing ${BLUE}curl${RED}, ${BLUE}ca-certificates${RED}, ${BLUE}gnupg${RED}, ${BLUE}lsb-release${RESET}"
# sudo apt-get install ca-certificates curl gnupg lsb-release -y
echo "${RED}Adding ${BLUE}Docker${RED}’s official ${BLUE}GPG key${RESET}"
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "${RED}setting up the stable repository${RESET}"
# echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "${RED}Re-update The System${RESET}"
# sudo apt-get update -y
echo "${RED}Installing ${BLUE}docker${RESET}"
# sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# echo "${GREEN}Do you want to Make docker run Without ${RED}sudo${GREEN}:${YELLOW} (y/N)${RESET}"
read -p "${GREEN}Do you want to Make docker run Without ${RED}sudo${GREEN}:${YELLOW} (y/N)${RESET}" answer
if [ $answer = 'y' ]
then
  echo "enter yes"
  # sudo groupadd docker
  # sudo gpasswd -a $USER docker
  # sudo service docker restart
else
  echo "enter no"
fi
echo "${RED}Downloading the current stable release of Docker Compose${RESET}"
# sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "${RED}Apply executable permissions to the binary${RESET}"
# sudo chmod +x /usr/local/bin/docker-compose
