@echo off

set enginePath=C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\DocBridge-Impress-Engine.TRUNK.Windows.6.1.64.MSC.INTELPC.AMD\bin\cpdff.exe
set inputPath=C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\COURRIERSIMPLEBIS.dff
set outputPath=C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\out\pdfOutput.pdf
set profilePath=C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\profiles
set dataPath=C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\input.xml
set logPath=C:\Users\tcr\Documents\GitHub\Publipostage_Studio_Backend\Backend\public\log
set logFile=testlog

%enginePath% -i %inputPath% -o %outputPath% -msg.addnolog XHM3005 -msg.addnolog CSS2005 -msg.addnolog XHM2002 -type pdf -profiledir %profilePath% -datafile %dataPath% -logdir %logPath% -logfile=%logFile%