::@echo off
::   Nombre del ZIP a generar es  ccr_CORPPLANTA.zip
::   CORP Sale de WebSite   "Corp", "CorpListDef"
::   PLANTA Sale de Summary "Rep", "PlantListShortName"
::   Ejemplo   		ccr_Hellenic HalyvourgiaHHAL.zip
::
::  NOTA cuando se van a reunir varios zip en uno solo usando juntarVarios_2.bat nombrar a los individuales 
::		  con el nombre definitivo mas una extension, ejemplo:
::		individuales:           ccr_Dongkuk SteelDSPohangAB.zip  y    ccr_Dongkuk SteelDSPohangIncheon.zip
::      zip final:				ccr_Dongkuk SteelDSPohang
::
d:

cd "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias"

::forfiles /D -2 /M CCR_* /C "cmd /c rmdir /s /q @path" 


::rd /S /Q "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos"
del "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr*.*"
del "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\*.zip"

::md "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos"

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

::set "Carpeta=CCR_VM2_%YYYY%%MM%%DD%%HH%%Min%%Sec%"
set "Carpeta=D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\Sistemas"
::set "Carpeta=D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\PRUEBA"
::-------------------- Aperam	Chatelet, Belgium    ------------------------------------------------------
::hornos=170		ccr_Aperam Chatelet EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_170.txt"  "170" "2020-12-02" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Aperam Chatelet EAF.zip" "%Carpeta%"


::hornos=220		ccr_Aperam Genk EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_220.txt"  "220" "2022-10-01" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Aperam Genk EAF.zip" "%Carpeta%"


::-------------------- Arvedi, Terni, Italy    ------------------------------------------------------
::hornos=227		ccr_Arvedi - Acciai Speciali Terni F4.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_227.txt"  "227" "2019-07-18" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Arvedi - Acciai Speciali Terni F4.zip" "%Carpeta%"

::--------------------ArcelorMittal ------------------------------------------------------

::hornos=68		ccr_Contrecoeur Est EAF C.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_68 69.txt"  "68" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Contrecoeur Est EAF C.zip" "%Carpeta%"

::hornos=69		ccr_Contrecoeur Est EAF D.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_68 69.txt"  "69" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Contrecoeur Est EAF D.zip" "%Carpeta%"

::hornos=158		ccr_ArcelorMittal Olaberria.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_158.txt"  "158" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittal Olaberria.zip" "%Carpeta%"

::--------------------CMC ------------------------------------------------------
::hornos=114     ccr_CMC Steel South Carolina.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_114.txt"  "114" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_CMC Steel South Carolina.zip" "%Carpeta%"

::hornos=130     ccr_CMC Poland.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_130.txt"  "130" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_CMC Poland.zip" "%Carpeta%"

::-------------------- Charter Steel ------------------------------------------------------
::hornos=219     Charter Steel
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_219.txt"  "219" "2022-11-16" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Charter Steel Cleveland EAF.zip" "%Carpeta%"


::--------------------Dongkuk ------------------------------------------------------
::hornos=147     ccr_Dongkuk Steel Shell A.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_147 150.txt"  "147" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Dongkuk Steel Pohang Shell A.zip" "%Carpeta%"

::hornos=150     ccr_Dongkuk Steel Shell B.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_147 150.txt"  "150" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Dongkuk Steel Pohang Shell B.zip" "%Carpeta%"

::hornos=176     ccr_Dongkuk Steel Incheon DC.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_176.txt"  "176" "2020-07-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Dongkuk Steel Incheon DC.zip" "%Carpeta%"

::--------------------Evraz    ------------------------------------------------------
::hornos=31     ccr_Evraz Rocky Mountain EAF 5.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_31.txt"  "31" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Evraz Rocky Mountain EAF 5.zip" "%Carpeta%"

::hornos=115     ccr_Evraz Regina EAF 4.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_115.txt"  "115" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Evraz Regina EAF 4.zip" "%Carpeta%"

::hornos=138     ccr_Evraz Regina EAF 5.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_138.txt"  "138" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Evraz Regina EAF 5.zip" "%Carpeta%"


::--------------------Finkl   ------------------------------------------------------
::hornos=136     ccr_Finkl Steel.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_136.txt"  "136" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Finkl Steel.zip" "%Carpeta%"

::--------------------  Hellenic Halyvourgia ------------------------------------------------------
::hornos=105     ccr_Hellenic Halyvourgia
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_105.txt"  "105" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Hellenic Halyvourgia.zip" "%Carpeta%"


::--------------------Hoeganaes Gallatin --------------------------------------------

::hornos=12     ccr_Hoeganaes Gallatin.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_12.txt"  "12" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Hoeganaes Gallatin.zip" "%Carpeta%"

::--------------------KWT Steel -----------------------------------------------------

::hornos=97     ccr_KWTSteel EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_97.txt"  "97" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_KWTSteel EAF.zip" "%Carpeta%"

::hornos=112     ccr_KWTSteel Substation.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_112.txt"  "112" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_KWTSteel Substation.zip" "%Carpeta%"

::--------------------NLMK Indiana --------------------------------------------------
::hornos=55     ccr_NLMK Indiana.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_55.txt"  "55" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NLMK Indiana.zip" "%Carpeta%"

::--------------------North Star Bluescope Steel ------------------------------------
::hornos=96 awv     ccr_NSBS Steel North Shell_awv.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_96 95 awv.txt"  "96" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS North_awv.zip"
D:
cd ""D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos"
:: wzunzip "ccr_NSBS North_awv.zip"
"c:\Program Files\7-Zip\7z.exe" x "ccr_NSBS North_awv.zip"

del "ccr_NSBS North_awv.zip"
rename "ccr_NSBS North.xls" "ccr_NSBS North_awv.xls"

::wzzip "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS North_awv.zip" *.xls
"c:\Program Files\7-Zip\7z.exe" -tzip a "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS North_awv.zip" *.xls

del *.xls

copy /Y "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS North_awv.zip" "%Carpeta%"


::hornos=95 awv     ccr_NSBS Steel South Shell_awv.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_96 95 awv.txt"  "95" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS South_awv.zip"
D:
cd ""D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos"
:: wzunzip "ccr_NSBS South_awv.zip"
"c:\Program Files\7-Zip\7z.exe" x "ccr_NSBS South_awv.zip"

del "ccr_NSBS South_awv.zip"
rename "ccr_NSBS South.xls" "ccr_NSBS South_awv.xls"

::wzzip "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS South_awv.zip" *.xls
"c:\Program Files\7-Zip\7z.exe" -tzip a "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS South_awv.zip" *.xls

del *.xls

copy /Y "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS South_awv.zip" "%Carpeta%"

::hornos=96     ccr_NSBS Steel North Shell.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_96 95.txt"  "96" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS North.zip" "%Carpeta%"

::hornos=95     ccr_NSBS Steel South Shell.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_96 95.txt"  "95" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS South.zip" "%Carpeta%"

::--------------------Nucor ---------------------------------------------------------
::hornos=206         ccr_BBX Nucor Decatur EAF North.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_206.txt"  "206" "2022-04-20" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_BBX Nucor Decatur EAF North.zip" "%Carpeta%"

::hornos=140         ccr_Duferco.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_140.txt"  "140" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Duferco.zip" "%Carpeta%"

::hornos=72			ccr_Nucor Gallatin EAF A.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_72 107.txt"  "72" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Gallatin EAF A.zip" "%Carpeta%"

::hornos=107 		ccr_Nucor Gallatin EAF C.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_72 107.txt"  "107" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Gallatin EAF C.zip" "%Carpeta%"

::hornos=106 		ccr_Nucor Hickman EAF 1.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_106.txt"  "106" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Hickman EAF 1.zip" "%Carpeta%"

::hornos=103 		ccr_Nucor Hickman EAF 2.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_103.txt"  "103" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Hickman EAF 2.zip" "%Carpeta%"

::hornos=102		ccr_Nucor Indiana South.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_102.txt"  "102" "2020-01-10" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Indiana - South.zip" "%Carpeta%"

::hornos=13     ccr_Nucor Kankakee.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_13.txt"  "13" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Kankakee.zip" "%Carpeta%"

::hornos=134     ccr_Nucor Memphis.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_134.txt"  "134" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\Ultimos\ccr_Nucor Memphis.zip" "%Carpeta%"

::hornos=73     ccr_Nucor Seattle.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_73.txt"  "73" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Seattle.zip" "%Carpeta%"

::hornos=27         ccr_Nucor Jackson.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_27.txt"  "27" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Jackson.zip" "%Carpeta%"

::hornos=142		ccr_Nucor Marion.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_142.txt"  "142" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Marion.zip" "%Carpeta%"

::hornos=174		ccr_Nucor Utah EAF 2.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_174.txt"  "174" "2020-03-26" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Utah EAF 2.zip" "%Carpeta%"

::hornos=183		ccr_Nucor Utah EAF 1.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_183.txt"  "183" "2020-09-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Utah EAF 1.zip" "%Carpeta%"

::hornos=183     ccr_Nucor Utah.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_183.txt"  "183" "2020-09-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNUTAF1.zip"

::hornos=188		ccr_Nucor Utah Substation EAF 1.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_188.txt"  "188" "2021-02-11" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Utah Substation EAF 1.zip" "%Carpeta%"

::hornos=189		ccr_Nucor Utah Substation EAF 2.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_189.txt"  "189" "2021-10-07" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Utah Substation EAF 2.zip" "%Carpeta%"

::hornos=92         	ccr_Nucor Yamato EAF 1.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_92.txt"  "92" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Yamato EAF 1.zip" "%Carpeta%"

::hornos=98         	ccr_Nucor Yamato EAF 2.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_98.txt"  "98" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor Yamato EAF 2.zip" "%Carpeta%"

::--------------------AltaSteel -----------------------------------------------------
::hornos=89     ccr_AltaSteel EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_89.txt"  "89" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_AltaSteel EAF.zip" "%Carpeta%"

::hornos=190     ccr_AltaSteel LMF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_190.txt"  "190" "2021-06-04" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_AltaSteel LMF.zip" "%Carpeta%"

::--------------------Gerdau LN ---------------------------------------------

::hornos=37         ccr_Gerdau LN Cartersville.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_37.txt"  "37" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Cartersville.zip" "%Carpeta%"

::hornos=168         ccr_Gerdau LN Cartersville LMF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_168.txt"  "168" "2020-02-11" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Cartersville LMF.zip" "%Carpeta%"

::hornos=32         ccr_Gerdau LN Charlotte.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_32.txt"  "32" "2020-05-03" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Charlotte.zip" "%Carpeta%"

::hornos=44     ccr_Gerdau LN Jackson.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_44.txt"  "44" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Jackson.zip" "%Carpeta%"

::hornos=135     ccr_Gerdau LN Midlothian EAF A.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_135.txt"  "135" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Midlothian EAF A.zip" "%Carpeta%"

::hornos=167     ccr_Gerdau LN Midlothian EAF B.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_167.txt"  "167" "2020-02-09" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Midlothian EAF B.zip" "%Carpeta%"

::hornos=153     ccr_Gerdau LN Petersburg.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_153.txt"  "153" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Petersburg.zip" "%Carpeta%"

::hornos=169     ccr_Gerdau LN Petersburg LMF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_169.txt"  "169" "2020-02-25" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Petersburg LMF.zip" "%Carpeta%"

::hornos=160     ccr_Gerdau LN Manitoba.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_160.txt"  "160" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Manitoba.zip" "%Carpeta%"

::hornos=161     ccr_Gerdau LN Manitoba LMF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_161.txt"  "161" "2021-08-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Manitoba LMF.zip" "%Carpeta%"

::hornos=152     ccr_Gerdau LN Whitby.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_152.txt"  "152" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Whitby.zip" "%Carpeta%"

::hornos=165     ccr_Gerdau LN Whitby LMF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_165.txt"  "165" "2020-10-28" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Whitby LMF.zip" "%Carpeta%"

::hornos=172     ccr_Gerdau LN Wilton EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_172.txt"  "172" "2020-10-02" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LN Wilton EAF.zip" "%Carpeta%"

::--------------------Gerdau  ------------------------------------------
::hornos=46         ccr_Gerdau Corsa Tultitlan.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_46.txt"  "46" "2022-04-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau Corsa Tultitlan.zip" "%Carpeta%"

::hornos=108         ccr_Gerdau Tuta.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_108.txt"  "108" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau Diaco Planta Tuta.zip" "%Carpeta%"


::--------------------Gerdau MacSteel ------------------------------------------
::hornos=148     	ccr_Gerdau MacSteel Fort Smith EAF 3.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_148 149.txt"  "148" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau MacSteel Fort Smith EAF 3.zip" "%Carpeta%"

::hornos=149     	ccr_Gerdau MacSteel Fort Smith EAF 4.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_148 149.txt"  "149" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau MacSteel Fort Smith EAF 4.zip" "%Carpeta%"

::hornos=173     ccr_Gerdau MacSteel Fort Smith LMF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_173.txt"  "173" "2020-07-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau MacSteel Fort Smith LMF.zip" "%Carpeta%"

::--------------------Grupo Siderurgico Reyna, Sogamoso, Boyacá, Colombia -----------------------------------------

::hornos=215     ccr_Grupo Siderurgico Reyna.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_215.txt"  "215" "2022-08-27" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Grupo Siderurgico Reyna.zip" "%Carpeta%"

::--------------------Carpenter Technology ------------------------------------------
::hornos=80     ccr_Carpenter Reading.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_80.txt"  "80" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Carpenter Reading F-fce.zip" "%Carpeta%"

::hornos=137     ccr_Carpenter Latrobe.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_137.txt"  "137" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Carpenter Latrobe.zip" "%Carpeta%"

::--------------------Cakratunggal Steel ----------------------------------------------
::hornos=159     ccr_Cakratunggal Steel.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_159.txt"  "159" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Cakratunggal Steel.zip" "%Carpeta%"

::--------------------OEMK ----------------------------------------------
::hornos=191     ccr_OEMK EAF 1.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_191.txt"  "191" "2021-06-22" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMK EAF 1.zip" "%Carpeta%"

::hornos=181     ccr_OEMK EAF 2.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_181.txt"  "181" "2020-10-30" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMK EAF 2.zip" "%Carpeta%"

::hornos=162     ccr_OEMK EAF 3.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_162.txt"  "162" "2020-11-01" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMK EAF 3.zip" "%Carpeta%"

::hornos=192     ccr_OEMK EAF 4.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_192.txt"  "192" "2021-02-08" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMK EAF 4.zip" "%Carpeta%"

::--------------------Outokumpu Steel ----------------------------------------------
::hornos=194     ccr_Outokumpu Stainless Calvert.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_194.txt"  "194" "2021-05-24" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Outokumpu Calvert EAF.zip" "%Carpeta%"

::--------------------North American Stainless ----------------------------------------------
::hornos=143     ccr_NAS Ghent F1.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_143.txt"  "143" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NAS Ghent F1.zip" "%Carpeta%"

::--------------------  Ovako  ------------------------------------------------------
::hornos=141     ccr_Ovako Hofors.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_141.txt"  "141" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Ovako Hofors.zip" "%Carpeta%"


::--------------------  Steel Dynamics Inc ------------------------------------------------------
::hornos=40     ccr_SDI Columbia City South
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_40.txt"  "40" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SDI Columbia City South.zip" "%Carpeta%"

::hornos=56     ccr_SDI Columbia City North
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_56.txt"  "56" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SDI Columbia City North.zip" "%Carpeta%"

::hornos=146     ccr_SDI Columbus South.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_146.txt"  "146" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SDI Columbus South.zip" "%Carpeta%"

::hornos=187     ccr_SDI Columbus North
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_187.txt"  "187" "2020-11-13" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SDI Columbus North.zip" "%Carpeta%"

::--------------------Sidoc	Acopi-Yumbo, Valle del Cauca, Colombia --------------------------------------------------
::hornos=74     ccr_Sidoc Yumbo Planta 2 HAE.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_74.txt"  "74" "2021-06-15" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Sidoc Yumbo Planta 2 HAE.zip" "%Carpeta%"

::--------------------Sidoc Planta2	Acopi-Yumbo, Valle del Cauca, Colombia --------------------------------------------------
::hornos=229     cr_SIDOC Yumbo HAE2.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_229.txt"  "229" "2019-07-18" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SIDOC Yumbo HAE 2.zip" "%Carpeta%"

::--------------------Southern Steel Malaysia --------------------------------------------------
::hornos=157     ccr_Southern Steel Malaysia.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_157.txt"  "157" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Southern Steel Malaysia.zip" "%Carpeta%"

::--------------------SSAB Alabama --------------------------------------------------
::hornos=94		ccr_SSAB Alabama East Shell.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_94.txt"  "94" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SSAB Alabama East Shell.zip" "%Carpeta%"

::hornos=93		ccr_SSAB Alabama West Shell.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_93.txt"  "93" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SSAB Alabama West Shell.zip" "%Carpeta%"

::--------------------Alleima Sandviken ------------------------------------------------------
::hornos=123     ccr_Alleima Sandviken EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_123.txt"  "123" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Alleima Sandviken EAF.zip" "%Carpeta%"

::-------------------- Standard Steel 	------------------------------------------------------
::hornos=127     ccr_Standard Steel.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_127.txt"  "127" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Standard Steel.zip" "%Carpeta%"

::--------------------SulbBahrain ----------------------------------------------
::hornos=144     ccr_SULB.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_144.txt"  "144" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SULB.zip" "%Carpeta%"

::-------------------- Tata Steel ------------------------------------------------------
::hornos=198     ccr_Tata Steel Bo Win Thailand EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_198.txt"  "198" "2022-02-11" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tata Steel Bo Win Thailand EAF.zip" "%Carpeta%"

::-------------------- Tenaris Koppel------------------------------------------------------
::hornos=122     ccr_Tenaris Koppel.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_122.txt"  "122" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tenaris Koppel.zip" "%Carpeta%"

::-------------------- Tokio Steel ----------------------------------------------
::hornos=178     ccr_Tokyo Steel - Kyushu DC.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_178.txt"  "178" "2020-07-20" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tokyo Steel - Kyushu DC.zip" "%Carpeta%"

::hornos=179     ccr_Tokyo Steel - Okayama DC.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_179.txt"  "179" "2020-08-12" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tokyo Steel - Okayama DC.zip" "%Carpeta%"

::hornos=184     ccr_Tokyo Steel - Tahara DC.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_184.txt"  "184" "2020-12-05" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tokyo Steel - Tahara DC.zip" "%Carpeta%"

::-------------------- Vallourec Star Youngstown --------------------------------------------------
::hornos=88     ccr_ccr_Vallourec Star Youngstown.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_88.txt"  "88" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ccr_Vallourec Star Youngstown.zip" "%Carpeta%"

::-------------------- Yamato Steel ---------------------------------------------------------
::hornos=113         ccr_Yamato Steel.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_113.txt"  "113" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Yamato Steel.zip" "%Carpeta%"

::hornos=129         ccr_Yamato Korea Steel.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_129.txt"  "129" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Yamato Korea Steel.zip" "%Carpeta%"

::hornos=131        ccr_Siam Yamato Steel 1.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_131.txt"  "131" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Siam Yamato Steel 1.zip" "%Carpeta%"

::hornos=139        ccr_Siam Yamato Steel 2.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_139.txt"  "139" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Siam Yamato Steel 2.zip" "%Carpeta%"


::-----------------------------------------------------------------------------------
::  Copiar al drive puente de maquinass auto
:: PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\CopiarCCRaF.ps1'">>D:\Sincronizar\VM2\salidaSTccr.txt

::cd "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal"

::rename ultimos "%Carpeta%"

del "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr*.*"

::rd ultimos 

:: Manda correo de diferencias de fechas TxCare, CCR
D:
CALL "D:\Sincronizar\VM2\actualizaCCR.bat"

