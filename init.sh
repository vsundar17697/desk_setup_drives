DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$DIR/"desk_setup_drives.sh"
mkdir ~/.dsd
cp -rf $DIR ~/.dsd/
touch ~/.dsd/desk_setup_drives.txt
DIR="~/.dsd/desk_setup_drives.sh"
chmod +xwr desk_setup_drives.sh 

#If user uses zsh, then alias is added to zshrc
if [ -e ~/.zshrc ]; then
    sudo echo "alias dsd=$DIR" >> ~/.zshrc
    echo "Initialization complete\nUse \"dsd -h\" for more information"

#If user uses bash, then alias is added to bash
elif [-e ~/.bash_profile]; then
    echo "alias dsd=$DIR" >> ~/.bash_profile
    echo "Initialization complete\nUse \"dsd -h\" for more information"

#If user uses anyother shell, he must enter the path to the shells rc file
else
    echo "zshrc and bash_profile not found !\nEnter file to add the alias to with path: "
    read file_name
    echo "alias dsd=$DIR" >> $file_name
    echo "Initialization complete\nUse \"dsd\" -h for more information"
fi

