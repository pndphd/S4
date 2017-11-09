@echo off
set SWARMHOME=%~dp0..\swarm
path=%SWARMHOME%\bin;%PATH%
path=%~dp0;%PATH%
S4SWARM.exe