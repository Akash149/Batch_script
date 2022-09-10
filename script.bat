@ECHO OFF
set dirname=MH RJ UP UK
setlocal EnableDelayedExpansion
set m=100
for %%a in (January February March April May June July August September October November December) do (
   set /A m+=1
   set mm[!m:~-2!]=%%a
)

for /F "tokens=2,4 delims=- " %%a in ("%date%") do (
    set yy=%date:~6,4%
   set mn=%%a
)
set srcpath=%cd%\sourcePath\%yy%\!mm[%mn%]!
set dstpath=%cd%\destinationPath\%yy%\!mm[%mn%]!

for %%x in (%dirname%) do (
     if exist %srcpath%\%%x (
        move %srcpath%\%%x\*.* %dstpath%\%%x\
        cd C:\Users\sakas\OneDrive\Desktop
    ) else (
        md %srcpath%\%%x
        )

    if exist %dstpath%\%%x (
        echo directory already exists
    ) else (
        md %dstpath%\%%x
    )
)
