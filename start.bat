@echo off

set RAMM=8G
set JARFILE=1.18.2.jar

set PATH=%PATH%;%cd%\PortableGit\cmd

copy /Y settings.txt server.properties

git pull

java -Xms%RAMM% -Xmx%RAMM% -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=50 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=50 -jar %JARFILE% nogui

pause > nul