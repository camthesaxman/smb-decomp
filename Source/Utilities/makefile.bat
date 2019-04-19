@echo off

rem Compile our program
gcc -o GenerateTrigLUT GenerateTrigLUT.c -std=c99
rem Pause so we can see any errors
pause
