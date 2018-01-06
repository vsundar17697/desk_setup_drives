Description: Desk setup manager is a script i wrote for myself and is tailored to my needs. My setup involves a macbook pro which also doubles as a workstation through my thunderbolt desk. However everytime i disconenct i had to disconnect all drives which are a part of my desk. This script is very simple to use and can save a lot of time. I've coupled this script along with another application to be executed on sleep and wake of my device. However that application would not make this script generic and thus you are free to use this any way you like.

Desk Setup Manager
Use

dsd -> unmount all drives that you mentioned is a part of your desk setup

dsd -a [DRIVE NAMES] -> add drives to be unmounted or mounted. These are the drives which are a part of your desk setup

dsd -r [DRIVE NAMES] -> remove drives which you earlier entered as a part of your desk setup

dsd -f -> unmounts all external drives connected to your desk setup. (Does not force unmount drives)

dsd -m -> mount all the external drives which are a part of your desk setup

dsd -c -> mount only drives that you mentioned as a part of your desk setup


