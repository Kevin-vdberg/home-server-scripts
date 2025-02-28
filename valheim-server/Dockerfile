FROM steamcmd/steamcmd:latest

ENV WORLD_NAME="World"
ENV PASSWORD="Password"

USER root

RUN steamcmd \
+@sSteamCmdForcePlatformType linux \ 
+force_install_dir /home/steam/valheim/ \
+login anonymous \
+app_update 896660 validate  \
+exit

WORKDIR /home/steam/valheim/

ENTRYPOINT export templdpath=$LD_LIBRARY_PATH \
&&export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH \
&&export SteamAppID=892970 \
&&/home/steam/valheim/valheim_server.x86_64 -name $WORLD_NAME -port 2456 -nographics -batchmode -world $WORLD_NAME -password $PASSWORD -public 0 \
&&export LD_LIBRARY_PATH=$templdpath

EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp
