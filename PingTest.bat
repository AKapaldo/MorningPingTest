@echo off
setlocal enabledelayedexpansion
set OUTPUT_FILE=c:\temp\PingTest_%date:~-10,2%%date:~-7,2%%date:~-4,4%.txt
>nul copy nul %OUTPUT_FILE%
for /f "tokens=1,*" %%i in (c:\temp\serverlist.txt) do (
  set SERVER_ADDRESS=ADDRESS N/A
  for /f "tokens=1,2,3" %%x in ('ping -n 1 %%i ^&^& echo SERVER_IS_UP') do (
    if %%x==Pinging set SERVER_ADDRESS=%%y
    if %%x==Reply set SERVER_ADDRESS=%%z
    if %%x==SERVER_IS_UP (set SERVER_STATE=Up) else (set SERVER_STATE=Down)
   )
   echo %%i [!SERVER_ADDRESS::=!] %%j is !SERVER_STATE! >>%OUTPUT_FILE%
   echo %%i [!SERVER_ADDRESS::=!] %%j is !SERVER_STATE!
)

pause
