@ECHO off
setlocal EnableDelayedExpansion
Title ArbitrageBot
color 0A
:CurlPage
curl https://coinarbitragebot.com/price/dogecoin.html -o plinko.txt
findstr /C:"arbitrage :" plinko.txt >>closer.txt
type "closer.txt"|repl " " ";" >"closertwo.txt"
del plinko.txt
del closer.txt
pause
del closertwo.txt
