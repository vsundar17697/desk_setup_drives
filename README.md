Description: Desk setup manager is a script i wrote for myself and is tailored to my needs. My setup involves a macbook pro which also doubles as a workstation through my thunderbolt desk. However everytime i disconenct i had to disconnect all drives which are a part of my desk. This script is very simple to use and can save a lot of time. I've coupled this script along with another application to be executed on sleep and wake of my device. However that application would not make this script generic and thus you are free to use this any way you like.

Please run 
chmod +x init.sh
sh init.sh 
from the pulled directory to add alias and initialize the file to keep track of the desk setup drives.

Desk Setup Manager
Use

dsd -> unmount all drives that you mentioned is a part of your desk setup

dsd -a [DRIVE NAMES] -> add drives to be unmounted or mounted. These are the drives which are a part of your desk setup

dsd -r [DRIVE NAMES] -> remove drives which you earlier entered as a part of your desk setup

dsd -f -> unmounts all external drives connected to your desk setup. (Does not force unmount drives)

dsd -m -> mount all the external drives which are a part of your desk setup

dsd -c -> mount only drives that you mentioned as a part of your desk setup


Example

dsd -a Sandisk WD // This will add Sandisk as a part of your desk drive

dsd -r WD // This will remove WD which you had earlier entered as a part of your desk

dsd // This will unmount only the content of your desk. In this case only Sandisk will be unmounted.

dsd -f // This will unmount all external drives connected to desk setup including the ones that aren't included in the desk drive list.

dsd -m // This will mount all external drives which are a part of your desk setup

dsd -c // This will mount all the external drives which are connected to your device.
