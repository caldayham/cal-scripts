@echo off

echo.
echo ================
echo "Hello World! This is a web search script written by Cal"
echo "For help with commands type 'srch -help'"
echo ================
echo. 

:: create three local variables: query, site, and newWin, and set to defaults
:: assign everything after the command but before a "-" or "|" as a string to "query"
SETLOCAL

SET QUERY=""
SET SITE="https://www.google.com/search?&q="

if "%1"=="" (goto :run)

SET NEXTSTRING=%1
if NOT x%NEXTSTRING:-=%==x%NEXTSTRING% (
goto :while
) else (
	SET QUERY=%NEXTSTRING%
)
SHIFT

:while
if "%1"=="" (goto :run)

SET NEXTSTRING=%1
if NOT x%NEXTSTRING:-=%==x%NEXTSTRING% (
:: check if there are any arguments, marked by the "-" flag 
	if NOT x%NEXTSTRING:y=%==x%NEXTSTRING% (
	SET SITE="https://www.youtube.com/results?search_query="
	) else if NOT x%NEXTSTRING:a=%==x%NEXTSTRING% (
	SET SITE="https://www.amazon.com/s?k="
	)else if NOT x%NEXTSTRING:t=%==x%NEXTSTRING% (
	SET SITE="https://www.thesaurus.com/browse/"
	)else if NOT x%NEXTSTRING:d=%==x%NEXTSTRING% (
	SET SITE="https://www.dictionary.com/browse/"
	)else if NOT x%NEXTSTRING:l=%==x%NEXTSTRING% (
	SET SITE="https://www.linkedin.com/search/results/all/?keywords="
	)else if NOT x%NEXTSTRING:m=%==x%NEXTSTRING% (
	SET SITE="https://mail.google.com/mail/u/0/#search/"
	)else if NOT x%NEXTSTRING:g=%==x%NEXTSTRING% (
	SET SITE="https://github.com/search?q="
	)else if NOT x%NEXTSTRING:w=%==x%NEXTSTRING% (
	SET SITE="https://en.wikipedia.org/wiki/Special:Search?go=Go&search="
	)
) else (
	SET QUERY=%QUERY%+%NEXTSTRING%
)
SHIFT
goto :while

:run
start "" ""%SITE%"%QUERY%"

ENDLOCAL
Exit /b

:: srch command takes three parameters
:: [string to search] 
:: [site to search in (-y)outube, (-g)oogle, (-a)mazon (default google)] 
:: [tab in (n)ew or (r)ecent window (default recent) 
	:: this letter argument is optionally added behind the site argument]
:: multiple searches can be searched together by putting the symbol "|" between them