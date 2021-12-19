#!/bin/bash
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 6`
RESET=`tput sgr0`

echo -e
echo -e
echo -e
echo -e
echo "██████╗  █████╗ ██████╗ ██╗    ███╗   ███╗███████╗██╗  ██╗██████╗ ██╗███████╗███████╗"
echo "██╔══██╗██╔══██╗██╔══██╗██║    ████╗ ████║██╔════╝██║  ██║██╔══██╗██║╚════██║╚════██║"
echo "██████╔╝███████║██████╔╝██║    ██╔████╔██║█████╗  ███████║██║  ██║██║   ██╔╝    ██╔╝"
echo "██╔══██╗██╔══██║██╔══██╗██║    ██║╚██╔╝██║██╔══╝  ██╔══██║██║  ██║██║  ██╔╝    ██╔╝"
echo "██████╔╝██║  ██║██║  ██║██║    ██║ ╚═╝ ██║███████╗██║  ██║██████╔╝██║  ██║     ██║"
echo "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═╝"
echo "${BLUE}══════════════════════════║Welcome to My script installer║═══════════════════════════${RESET}"
echo -e
echo -e
echo -e
echo -e

read -p "${GREEN}Do you want to ${RED}Update Your System?${GREEN}:${YELLOW} [y/N]${RESET}" update
read -p "${GREEN}Do you want to ${RED}Install git?${GREEN}:${YELLOW} [y/N]${RESET}" git
read -p "${GREEN}Do you want to ${RED}Install zsh?${GREEN}:${YELLOW} [y/N]${RESET}" zsh
read -p "${GREEN}Do you want to ${RED}Install vim?${GREEN}:${YELLOW} [y/N]${RESET}" vim
read -p "${GREEN}Do you want to ${RED}Install FileZilla?${GREEN}:${YELLOW} [y/N]${RESET}" file
read -p "${GREEN}Do you want to ${RED}Install openssh?${GREEN}:${YELLOW} [y/N]${RESET}" os
read -p "${GREEN}Do you want to ${RED}Install curl?${GREEN}:${YELLOW} [y/N]${RESET}" curl
read -p "${GREEN}Do you want to ${RED}Install lsb-release?${GREEN}:${YELLOW} [y/N]${RESET}" lsb
read -p "${GREEN}Do you want to ${RED}Install Docker?${GREEN}:${YELLOW} [y/N]${RESET}" docker
read -p "${GREEN}Do you want to Make docker run Without ${RED}sudo${GREEN}:${YELLOW} [y/N]${RESET}" dsudo
read -p "${GREEN}Do you want to ${RED}Install Docker Compose?${GREEN}:${YELLOW} [y/N]${RESET}" dc

echo -e
echo -e
echo -e
echo -e
echo "${RED}════════════║Thank You, Please wait....║════════════${RESET}"
echo -e
echo -e
echo -e
echo -e

sleep 2


if [ "$update" == "y" ]
then
  echo "${RED}Updating The System${RESET}"
  sudo apt-get update -y
fi
if [ "$os" = 'y' ]
then
  # if ! [ -x "$(command -v ssh)" ]
  if ! [ -x "$(systemctl status ssh)" ]
  then
      echo "${GREEN}Installing ${BLUE}openssh${RESET}"
      sudo apt install openssh-server -y
  else
    echo "${BLUE}openssh${RED} already Installed${RESET}"
  fi
fi
if [ "$zsh" = 'y' ]
then
  if ! [ -x "$(command -v zsh)" ]
  then
      echo "${GREEN}Installing ${BLUE}zsh${RESET}"
      sudo apt install zsh -y
      sudo apt install git-core curl fonts-powerline -y
      sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  else
    echo "${BLUE}zsh${RED} already Installed${RESET}"
  fi
fi
if [ "$git" = 'y' ]
then
  if ! [ -x "$(command -v git)" ]
  then
    echo "${GREEN}Installing ${BLUE}git${RESET}"
    sudo apt install git -y
  else
    echo "${BLUE}git${RED} already Installed${RESET}"
  fi
fi
if [ "$vim" = 'y' ]
then
  if ! [ -x "$(command -v vim)" ]
  then
    echo "${GREEN}Installing ${BLUE}vim${RESET}"
    sudo apt install vim -y
  else
    echo "${BLUE}vim${RED} already Installed${RESET}"
  fi
fi
if [ "$file" = 'y' ]
then
  if ! [ -x "$(command -v filezilla)" ]
  then
    echo "${GREEN}Installing ${BLUE}FileZilla${RESET}"
    sudo apt install filezilla -y
  else
    echo "${BLUE}FileZilla${RED} already Installed${RESET}"
  fi
fi
if [ "$curl" = 'y' ]
then
  if ! [ -x "$(command -v curl)" ]
  then
    echo "${GREEN}Installing ${BLUE}curl${RED}, ${BLUE}ca-certificates${RED} and ${BLUE}gnupg${RESET}"
    sudo apt-get install ca-certificates curl gnupg lsb-release -y
  else
    echo "${BLUE}curl${RED} already Installed${RESET}"
  fi
fi
if [ "$curl" = 'y' ]
then
  if ! [ -x "$(command -v lsb_release)" ]
  then
    echo "${GREEN}Installing ${BLUE}lsb-release${RESET}"
    sudo apt-get install lsb-release -y
  else
    echo "${BLUE}lsb_release${RED} already Installed${RESET}"
  fi
fi
if [ "$docker" = 'y' ]
then
  if ! [ -x "$(command -v docker)" ]
  then
    echo "${GREEN}Adding ${BLUE}Docker${GREEN}’s official ${BLUE}GPG key${RESET}"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "${GREEN}setting up the stable repository${RESET}"
    echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    echo "${GREEN}Re-update The System${RESET}"
    sudo apt-get update -y
    echo "${GREEN}Installing ${BLUE}docker${RESET}"
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    else
      echo "${BLUE}docker${RED} already Installed${RESET}"
    fi
fi
if [ "$dsudo" = 'y' ]
then
  echo "${GREEN}Make docker run as${BLUE} root${RESET}"
  if grep -q docker /etc/group
  then
    echo "${GREEN}The Group${BLUE} docker${GREEN} Exists${RESET}"
  else
    sudo groupadd docker
  fi
  sudo usermod -aG docker $USER
  sudo service docker restart
fi
if [ "$dc" = 'y' ]
then
  if ! [ -x "$(command -v docker-compose)" ]
  then
    echo "${GREEN}Downloading the current stable release of Docker Compose${RESET}"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    echo "${GREEN}Apply executable permissions to the binary${RESET}"
    sudo chmod +x /usr/local/bin/docker-compose
  else
    echo "${BLUE}docker-compose${RED} already Installed${RESET}"
  fi
fi

if [ "$dsudo" == 'y' ]
then
  echo -e "${RED}╔════════════════════════════║NOTE:║════════════════════════╗${RESET}"
  echo -e "${RED}║   ${BLUE} Please Restart Your machine To apply Those changes!${RED}    ║${RESET}"
  echo -e "${RED}╚═══════════════════════════════════════════════════════════╝${RESET}"
fi
