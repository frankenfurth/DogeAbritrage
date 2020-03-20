@ECHO off
setlocal enabledelayedexpansion
Title ArbitrageBot
color 0A
del closer.txt
:CurlPage
curl https://coinarbitragebot.com/price/dogecoin.html -o plinko.txt
findstr /C:"arbitrage :" plinko.txt >>closer.txt

type closer.txt | repl " " "">>closer2.txt
del closer.txt
type closer2.txt | repl ">" "">>closer.txt
del closer2.txt
type closer.txt | repl "<" "">>closer2.txt
del closer.txt
type closer2.txt | repl "'" "">>closer.txt
del closer2.txt
type closer.txt | repl "_" "">>closer2.txt
del closer.txt
type closer2.txt | repl "|" "">>closer.txt
del closer2.txt


for /F "delims=" %%a in (closer.txt) do (
    set /A count+=1
    set "array[!count!]=%%a"
)
for /L %%i in (1,1,%count%) do echo !array[%%i]!



del plinko.txt
pause