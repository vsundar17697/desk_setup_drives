file="desk_setup_drives.txt"
flag=0
temp="temp.txt"

while getopts ":armfch" opt; do 
	case $opt in 
		a)
			flag=1;
			shift 1
			;;

		r)
			flag=2;
			shift 1
			;;

		m)
			flag=3;
			shift 1
			;;

		f)
			flag=4;
			shift 1
			;;

		c)
			flag=5;
			shift 1
			;;

		h)
			flag=-1;
			shift 1
			;;

		\?)
			echo "invalid option";
			flag=-1
			;;
	esac
done

if [ $flag -eq 1 ]; then
	for disks_to_add in "$@"
	do
		if ! grep -Fxq $disks_to_add "$file";
		then
			echo $disks_to_add >> $file
		fi
	done
	cat $file

elif [ $flag -eq 2 ]; then
	for disks_to_remove in "$@"
	do
		while read -r line
		do
			[[ ! $line =~ $disks_to_remove ]] && echo "$line"
		done < $file > $temp
	done
	mv $temp $file
	cat $file

elif [ $flag -eq 3 ]; then
	disk_list="$(diskutil list | grep -v internal | grep -v synthesized | grep /dev/disk | awk '{print substr($1 , 6)}')"
	for disk in "${disk_list[@]}"
	do
		echo "$disk"
		diskutil mountDisk "$disk"
	done

elif [ $flag -eq 4 ]; then
	disk_list="$(diskutil list | grep -v internal | grep -v synthesized | grep /dev/disk | awk '{print substr($1 , 6)}')"
	for disk in "${disk_list[@]}"
	do
		diskutil unmountDisk "$disk"
	done

elif [ $flag -eq 5 ]; then
	while IFS='' read -r line || [[ -n "$line" ]]; do
		disk="$(diskutil list | grep $line | awk '{print substr($NF , 0 , 5)}')"
		if [[ -n "$disk" ]]; then
			diskutil mountDisk "$disk"
		fi
	done < "$file"

elif [ $flag -eq 0 ]; then
	while IFS='' read -r line || [[ -n "$line" ]]; do
		disk="$(diskutil list | grep $line | awk '{print substr($NF , 0 , 5)}')"
		if [[ -n "$disk" ]]; then
			diskutil unmountDisk "$disk"
		fi
	done < "$file"

elif [ $flag -eq -1 ]; then
	
	less man.txt

fi