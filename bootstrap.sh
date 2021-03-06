
function okMsg {
  echo -e "\e[1;32m $@ \e[0m"
}

function warningMsg {
  echo -e "\e[1;33m $@ \e[0m"
}


function errorMsg {
  echo -e "\e[1;31m $@ \e[0m"
  exit -1
}

function exitOnNo {
  ans=""
  read ans

  if [[ $ans != "y" ]]; then
    exit -1
  fi
}

echo "This script will do a complete setup of the rover. It will download git repos and config files"
warningMsg "WARNING: this mean that files will be overwritten! backup your old files if not sure"
echo "Continue? [y/N]"

exitOnNo

echo "Moving to home directory..."
cd ~

# This needs to happen otherwise we might have non symlinks for .gitconfig
echo "Downloading the dotfiles repo repo..."
git clone https://github.com/team-diana/dotfiles.git .dotfiles || errorMsg "Unable to retrieve scriptsles.git from git"
echo "Starting dotfiles bootstrap..."
cd ~/.dotfiles
bash ./script/bootstrap
cd ~
mkdir ~/.vim/.undo
mkdir ~/.vim-tmp
okMsg "dotfiles copied"

echo "Downloading the script repo..."
git clone https://github.com/team-diana/scripts.git  || errorMsg "Unable to retrieve scripts from git"
okMsg "Download done"

echo "Downloading the catkin_ws repo..."
git clone https://github.com/team-diana/catkin_ws.git  || errorMsg "Unable to retrieve the catkin_ws repo from git"
echo "Init submodules"
cd catkin_ws 
git submodule init && git submodule update || errorMsg "Unable to retrieve submodules"
cd ..
okMsg "Download done"

echo "Install needed packages... (Requires root permission) [Y/n]"
ans=""
read ans

if [[ $ans != "n" ]]; then
  #TODO: add all the needed libs
  packages="tree vim cron ranger zsh unzip"
  sudo apt-get install $packages || errorMsg "Unable to install packages"
  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
  wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
  sudo apt-get install ros-hydro-desktop-full
  sudo rosdep init
  rosdep update
  sudo apt-get install python-rosinstall
fi

echo "Install third party drivers... (Requires root permission) [Y/n]"
read ans

if [[ $ans != "n" ]]; then
  #TODO: add all the needed libs
  roverPackagesAddr=""
  warningMsg "Insert the link from where the rover-packages directory can be downloaded (gdrive zip file)"
  read roverPackagesAddr
  wget $roverPackagesAddr -O rover-packages.zip || errorMsg "Unable to download rover-packages"
  unzip -x rover-packages.zip
  cd rover-packages
  cp ~/scripts/install-rover-packages.sh .
  bash ./install-rover-packages.sh
  okMsg "Packages installed"
fi

echo "Copying init files... (Requires root permission)"
sudo bash ~/scripts/update-links.sh || errorMsg "Unable to install init files"
okMsg "Init files copied"

okMsg "SETUP COMPLETED"
