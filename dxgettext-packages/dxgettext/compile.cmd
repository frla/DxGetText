@echo off

set sourcedir=\source\dxgettext\trunk\dxgettext\
set pkgdir=\source\dxgettext\trunk\dxgettext-packages\

move stripifdef.exe dxgettext\

pushd "%sourcedir%"

call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%dxgettext\" dxgettext
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%dxgettext\" ggdxgettext
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\assemble\" assemble
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\assemble\" ggassemble
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\dxgreg\" dxgreg
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\ggmerge\" ggmerge
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\ggmerge\" msgmergedx
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\ggfmt\" ggfmt
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\msgimport\" msgimport
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\msgstripCR\" msgstripCR
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\msgmergePOT\" msgmergePOT
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\msgsplitTStrings\" msgsplitTStrings
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\msgmkignore\" msgmkignore
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\msgremove\" msgremove
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\msgshowheader\" msgshowheader
call %pkgdir%dxgettext\compileprj.cmd "%pkgdir%" "%sourcedir%tools\stripifdef\" stripifdef

popd

move dxgettext\stripifdef.exe .

pause

stripifdef %sourcedir%sample\gnugettext.pas dxgettext\gnugettext.pas
copy dxgettext\gnugettext.pas dxgettext\example\gnugettext.pas
copy %sourcedir%sample\gnugettext.pas dxgettext\delphi5\gnugettext.pas
copy %sourcedir%sample\gnugettextD5.pas dxgettext\delphi5\gnugettextD5.pas

copy %sourcedir%languages\languagecodes.pas dxgettext\
copy %sourcedir%languages\languagecodes.po dxgettext\
copy %sourcedir%languages\languagecodes.txt dxgettext\

"c:\programmer\Inno Setup 4\iscc.exe" setup.iss
pause