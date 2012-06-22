rem @echo off
rem compileprj.cmd pkgdir sourcedir projectname 

del %1dxgettext\dxgettext\%3.exe

pushd %2
c:\programmer\borland\bds\3.0\bin\dcc32 -B %3.dpr
move %3.exe %1dxgettext\dxgettext\
popd
