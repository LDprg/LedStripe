@echo off

if exist ".\VHDL" (
	echo VHDL exist
) 
if not exist ".\VHDL" (
	mkdir ".\VHDL";
	echo VHDL created
)

if exist ".\SIM" (
	echo SIM exist
) 
if not exist ".\SIM" (
	mkdir ".\SIM";
	echo SIM created
)

cd .\SIM

echo starting Questasim

C:\questasim64_10.7c\win64\questasim.exe

echo finish starting Questasim

cd .\..

echo finish creating or starting project

rem pause