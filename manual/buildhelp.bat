@echo off

if /I "%1" == "/S" "C:\Program Files (x86)\HTML Help Workshop\hhc.exe" ooHG.hhp > nul
if /I not "%1" == "/S" "C:\Program Files (x86)\HTML Help Workshop\hhc.exe" ooHG.hhp
