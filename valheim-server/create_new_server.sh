#!/usr/bin/env bash

echo "This will create a new container based on the current Docker image, please update the image first if needed"

#Optional:
#set directory
# echo Specify the working directory
# read directoryToInstall
# cd $directoryToInstall 

cd /home/server/containers/valheim/containers

#create new container data

EXISTING_SERVER_NUMBER=$(ls | wc -l)
NEW_SERVER_NUMBER=$(($EXISTING_SERVER_NUMBER + 1))
mkdir "container$NEW_SERVER_NUMBER"

cd "container$NEW_SERVER_NUMBER"

mkdir data
touch variables.env
touch start_container

#set variables
echo Set the world name
read inputWorldName

echo Set the password
read inputPassword

echo Set the port to run the server
read inputPort
    
directory=$(pwd)"/data"

#Create environment file and starting script
echo -e "#!/bin/bash\n\nport=$inputPort\ndirectory=$directory\n\ndocker run --name valheim$NEW_SERVER_NUMBER -v \$directory:/root/.config/unity3d/IronGate/Valheim -itd -p \$port:2456/udp --env-file ./variables.env 6417e7b82476" >> start_container
echo -e "WORLD_NAME=$inputWorldName\nPASSWORD=$inputPassword" >> variables.env

#set permissions for new files
chmod ugo=r variables.env
chmod ugo=rwx start_container


echo "New container setup in folder:" "containers/container$NEW_SERVER_NUMBER"
