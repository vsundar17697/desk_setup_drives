touch desk_setup_drives.txt
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$DIR/"desk_setup_drives.sh"
chmod +x desk_setup_drives.sh
chmod +x init.sh 

if [ -e ~/.zshrc ]; then
    sudo echo "alias dsd=$DIR" >> ~/.zshrc
    source ~/.zshrc
    echo "Initialization complete\nUse \"dsd\" -h for more information"
elif [-e ~/.bash_profile]; then
    echo "alias dsd=$DIR" >> ~/.bash_profile
    source ~/.bash_profile
    echo "Initialization complete\nUse \"dsd\" -h for more information"
else
    echo "zshrc and bash_profile not found !\nEnter file to add the alias to with path: "
    read file_name
    echo "alias dsd=$DIR" >> $file_name
    source $file_name
    echo "Initialization complete\nUse \"dsd\" -h for more information"
fi