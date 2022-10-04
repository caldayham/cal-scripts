:: jd (jump directory) is a simple file that allows you to jump directories directly into ones you use most often

@ECHO OFF

SET JDARG=%1
if "%JDARG%"=="n" (
	CD "C:\Users\caldayham\Personal\notes"
) else if "%JDARG%"=="t" (
	CD "C:\Users\caldayham\Personal\todos"
) else if "%JDARG%"=="c" (
	CD "C:\Users\caldayham"
) else if "%JDARG%"=="m" (
	CD "C:\Users\caldayham\MarusGroup"
) else if "%JDARG%"=="p" (
	CD "C:\Users\caldayham\MarusGroup\printsci"
)