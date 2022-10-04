:: A batch script for sleeping, restarting, and shutting down my computer

:: [pwr] to sleep (or any other shit after the command besides other flags)
:: [pwr -r] to restart
:: [pwr -k] to kill or completely shut down the computer
:: [pwr -h] to hibernate the computer

@ECHO OFF

SETLOCAL

SET COMMAND=rundll32.exe powrprof.dll, SetSuspendState Sleep

IF "%1"=="-r" (
SET COMMAND=shutdown.exe /r /t 00
) ELSE IF "%1"=="-k" (
SET COMMAND=shutdown.exe /s /t 00
) ELSE IF "%1"=="-h" (
SET COMMAND=shutdown.exe /h
)

:: RUN THE COMMAND
%COMMAND%

ENDLOCAL
Exit /b