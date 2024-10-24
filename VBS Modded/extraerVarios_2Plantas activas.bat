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
::set "Carpeta=D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\CCR_VM2_20181128090000"
set "Carpeta=D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\PRUEBA"
::-------------------- Aperam	Chatelet, Belgium    ------------------------------------------------------
::hornos=170		ccr_Aperam Chatelet EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_170.txt"  "170" "2020-12-02" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_AperamAPECHAT.zip" "%Carpeta%"

::hornos=220		ccr_Aperam Genk EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_220.txt"  "220" "2022-10-01" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_AperamAPEGNK.zip" "%Carpeta%"

::--------------------ArcelorMittal ------------------------------------------------------
::hornos=54 49 53		ccr_Lazaro Cardenas EAF 1.xls, ccr_Lazaro Cardenas EAF 3.xls, ccr_Lazaro Cardenas EAF 4.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_54 49 53.txt"  "54,49,53" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalLZC01.zip" "%Carpeta%"
::hornos=57		ccr_Lazaro Cardenas EAF 2.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_57.txt"  "57" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalLZC02.zip"
::Reunir todos los de Arcelor en un ZP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" ccr_ArcelorMittalLZC

::hornos=68,69  ccr_Contrecoeur Est EAF C.xls,ccr_Contrecoeur Est EAF D.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_68 69.txt"  "68,69" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalCCE.zip" "%Carpeta%"

::hornos=67     ccr_Contrecoeur Ouest.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_67.txt"  "67" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalCCW.zip" "%Carpeta%"
::hornos=99     ccr_Cariacica.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_99.txt"  "99" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalCAR.zip" "%Carpeta%"
::hornos=100    ccr_Juiz de Fora.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_100.txt"  "100" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalJUZF.zip" "%Carpeta%"
::hornos=83     ccr_Piracicaba.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_83.txt"  "83" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalPIR.zip" "%Carpeta%"
::Reunir todos los de Arcelor en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" ccr_ArcelorMittal

::hornos=158     ccr_ArcelorMittal Olaberria.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_158.txt"  "158" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_ArcelorMittalOLA.zip" "%Carpeta%"

::-------------------- Bayou Steel Laplace    ------------------------------------------------------
::hornos=66		ccr_Bayou Steel Laplace.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_66.txt"  "66" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Bayou SteelBLAP.zip" "%Carpeta%"

::-------------------- Liberty Steel    ------------------------------------------------------
::hornos=145		ccr_Liberty Steel Georgetown.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_145.txt"  "145" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Liberty SteelGTNEAF1.zip"

::hornos=71		ccr_Georgetown #1 EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_71.txt"  "71" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Liberty SteelGTNEAF1OLD.zip"

::Reunir todos los de Liberty en un ZIP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Liberty SteelGTN" "%Carpeta%"

::--------------------CMC ------------------------------------------------------
::hornos=114     ccr_CMC Steel South Carolina.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_114.txt"  "114" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_CMCSC.zip" "%Carpeta%"

::hornos=130     ccr_CMC Poland.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_130.txt"  "130" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_CMCPOL.zip" "%Carpeta%"

::-------------------- Charter Steel ------------------------------------------------------
::hornos=219     Charter Steel
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_219.txt"  "219" "2022-11-16" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Charter SteelCHSCLE.zip" "%Carpeta%"


::--------------------Dongkuk ------------------------------------------------------
::hornos=147,150     ccr_Dongkuk Steel Shell A.xls,ccr_Dongkuk Steel Shell B.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_147 150.txt"  "147,150" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Dongkuk SteelDSPohang.zip" "%Carpeta%"

::hornos=176     ccr_Dongkuk Steel Incheon DC.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_176.txt"  "176" "2020-07-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Dongkuk SteelDSIncheon.zip" "%Carpeta%"

::--------------------Evraz    ------------------------------------------------------
::hornos=31     ccr_Rocky Mountain EAF 5.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_31.txt"  "31" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_EvrazRMSM.zip" "%Carpeta%"
::TrabajoTemporal
::hornos=115    ccr_Evraz Regina EAF 4.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_115.txt"  "115" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_EvrazReginaF4.zip"

::hornos=138    ccr_Evraz Regina EAF 5.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_138.txt"  "138" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_EvrazReginaF5.zip"

::Reunir todos los de Evraz Regina en un ZIP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_EvrazRegina" "%Carpeta%"

::--------------------Finkl   ------------------------------------------------------
::hornos=136     ccr_Finkl Steel.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_136.txt"  "136" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Finkl SteelFinklCH.zip" "%Carpeta%"

::--------------------  Hellenic Halyvourgia ------------------------------------------------------
::hornos=105     ccr_Hellenic Halyvourgia
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_105.txt"  "105" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Hellenic HalyvourgiaHHAL.zip" "%Carpeta%"


::--------------------Hoeganaes Gallatin --------------------------------------------
REM ::hornos=12     ccr_Hoeganaes Gallatin.xls

::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_12.txt"  "12" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_HoeganaesGAL.zip" "%Carpeta%"



::--------------------KWT Steel -----------------------------------------------------
::hornos=97     ccr_KWTSteel EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_97.txt"  "97" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_KWT SteelKWT01.zip"

::hornos=112     ccr_KWTSteel Substation.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_112.txt"  "112" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_KWT SteelKWT02.zip"

::Reunir todos los de Kuwait en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_KWT STeelKWT" "%Carpeta%"



::--------------------LeTourneau Technologies ---------------------------------------
::hornos=78     ccr_LeTourneau EAF D.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_78.txt"  "78" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_LeTourneauLET01.zip"

::hornos=79     ccr_LeTourneau EAF D.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_79.txt"  "79" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_LeTourneauLET02.zip"

::Reunir todos los de LeTourneau en un ZP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_LeTourneauLET" "%Carpeta%"

::--------------------NLMK Indiana --------------------------------------------------
::hornos=55     ccr_NLMK Indiana.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_55.txt"  "55" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NLMKIND.zip" "%Carpeta%"

::--------------------North Star Bluescope Steel ------------------------------------
::hornos=96 95  awv   		ccr_NSBS Steel North Shell_awv.xls, ccr_NSBS Steel South Shell_awv.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_96 95 awv.txt"  "96,95" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBSawv.zip"
::D:
::cd ""D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos"
:: wzunzip "ccr_NSBSawv.zip"
::"c:\Program Files\7-Zip\7z.exe" x "ccr_NSBSawv.zip"

::del "ccr_NSBSawv.zip"
::rename "ccr_NSBS North.xls" "ccr_NSBS North_awv.xls"
::rename "ccr_NSBS South.xls" "ccr_NSBS South_awv.xls"

::hornos=96,95  		ccr_NSBS Steel North Shell.xls,ccr_NSBS Steel South Shell.xls
REM call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_96 95.txt"  "96,95" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NSBS.zip"

REM ::wzunzip "ccr_NSBS.zip"
REM "c:\Program Files\7-Zip\7z.exe" x "ccr_NSBS.zip"

REM del "ccr_NSBS.zip"

REM ::wzzip "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_North Star Bluescope SteelNSBS.zip" *.xls
REM "c:\Program Files\7-Zip\7z.exe" -tzip a "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_North Star Bluescope SteelNSBS.zip" *.xls

REM del *.xls

REM copy /Y "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_North Star Bluescope SteelNSBS.zip" "%Carpeta%"


::--------------------Nucor ---------------------------------------------------------
::hornos=206         ccr_BBX Nucor Decatur EAF North.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_206.txt"  "206" "2022-04-20" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNDEC.zip" "%Carpeta%"


::hornos=140         ccr_Duferco.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_140.txt"  "140" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNDUF.zip" "%Carpeta%"


::hornos=72,107 ccr_Nucor Gallatin EAF A.xls,ccr_Nucor Gallatin EAF C.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_72 107.txt"  "72,107" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNGAL.zip" "%Carpeta%"


::hornos=101              ccr_Nucor Indiana - North.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_101.txt"  "101" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNINDN.zip"

::hornos=102              ccr_Nucor Indiana - South.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_102.txt"  "102" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNINDS.zip"

::Reunir los de Nucor Indiana en un ZP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Nucor SteelNIND" "%Carpeta%"

::hornos=106     ccr_Nucor Hickman EAF 1.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_106.txt"  "106" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNHICKEAF1.zip"

::hornos=103     ccr_Nucor Hickman EAF 2.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_103.txt"  "103" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNHICKEAF2.zip"


::Reunir todos los de Nucor Hickman en un ZIP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Nucor SteelNHICK" "%Carpeta%"


::hornos=13     ccr_Nucor Kankakee.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_13.txt"  "13" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNKAN.zip" "%Carpeta%"

::hornos=134     ccr_Nucor Memphis.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_134.txt"  "134" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\Ultimos\ccr_Nucor SteelNMEM.zip" "%Carpeta%"

::hornos=73     ccr_Nucor Seattle.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_73.txt"  "73" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNSEA.zip" "%Carpeta%"

::hornos=27         ccr_Nucor Jackson.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_27.txt"  "27" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNJAK.zip" "%Carpeta%"


::hornos=142		ccr_Nucor Marion.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_142.txt"  "142" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNMAR.zip" "%Carpeta%"


::hornos=174     ccr_Nucor Utah.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_174.txt"  "174" "2020-03-26" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNUTAF2.zip"

::hornos=183     ccr_Nucor Utah.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_183.txt"  "183" "2020-09-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNUTAF1.zip"

::hornos=188     ccr_Nucor Utah Substation EAF 1.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_188.txt"  "188" "2021-02-11" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNUTASubF1.zip"

::hornos=189     ccr_Nucor Utah Substation EAF 2.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_189.txt"  "189" "2021-10-07" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNUTASubF2.zip"

::Reunir todos los de Nucro Utah en un ZIP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Nucor SteelNUTA" "%Carpeta%"

::hornos=92         	ccr_Nucor Yamato EAF 1.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_92.txt"  "92" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNYEAF1.zip"

::hornos=98         	ccr_Nucor Yamato EAF 2.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_98.txt"  "98" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Nucor SteelNYEAF2.zip"

::Reunir todos los de Nucor Yamato en un ZIP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Nucor SteelNY" "%Carpeta%"

::Reunir todos los de Nucor en un ZP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Nucor Steel"

::--------------------AltaSteel -----------------------------------------------------
::hornos=89     ccr_AltaSteel EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_89.txt"  "89" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Scaw MetalsAltaEAF.zip" 

::hornos=190     ccr_AltaSteel LMF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_190.txt"  "190" "2021-06-04" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Scaw MetalsAltaLMF.zip" 

::Reunir todos los de AltaSteel en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Scaw MetalsAlta" "%Carpeta%"


::--------------------Warren Steel Holdings -----------------------------------------
::hornos=91     ccr_Warren Steel.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_91.txt"  "91" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Warren SteelWSH.zip" "%Carpeta%"

::--------------------Alton Steel ---------------------------------------------------
::hornos=87     ccr_Alton Steel.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_87.txt"  "87" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Alton SteelALTN.zip" "%Carpeta%"

::-------------------- AK Steel Butler   ------------------------------------------------------
::hornos=133		ccr_AK Steel Butler.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_133.txt"  "133" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_AK SteelButler.zip" "%Carpeta%"

::--------------------Gerdau LN ---------------------------------------------
::hornos=37         ccr_Gerdau LN Cartersville.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_37.txt"  "37" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNCVLEAF.zip" 

::hornos=168		ccr_Gerdau LN Cartersville LMF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_168.txt"  "168" "2020-02" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNCVLLMF.zip" 

::Reunir todos los de Cartersville en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Gerdau LNGLNCVL" "%Carpeta%"

::hornos=32         ccr_Gerdau LN Charlotte.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_32.txt"  "32" "2020-05-03" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNCHL.zip" "%Carpeta%"

::hornos=44     ccr_Gerdau LN Jackson.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_44.txt"  "44" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNJKS.zip" "%Carpeta%"

::hornos=135     ccr_Gerdau LN Midlothian EAF A.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_135.txt"  "135" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNMidA.zip" 


::hornos=167     ccr_Gerdau LN Midlothian EAF B.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_167.txt"  "167" "2020-02-09" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNMidB.zip" 

::Reunir todos los de Midlothian en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Gerdau LNGLNMid" "%Carpeta%"


::hornos=153     ccr_Gerdau LN Petersburg.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_153.txt"  "153" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNPTBEAF.zip" 

::hornos=169     ccr_Gerdau LN Petersburg LMF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_169.txt"  "169" "2020-02-25" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNPTBLMF.zip" 

::Reunir todos los de Petersburg en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Gerdau LNGLNPTB" "%Carpeta%"

::hornos=160     ccr_Gerdau LN Manitoba.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_160.txt"  "160" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNMTBEAF.zip" 

::hornos=161     ccr_Gerdau LN Manitoba LMF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_161.txt"  "161" "2021-08-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNMTBLMF.zip" 

::Reunir todos los de Manitoba en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Gerdau LNGLNMTB" "%Carpeta%"




::hornos=163     ccr_Gerdau LN St Paul.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_163.txt"  "163" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNSTP.zip" "%Carpeta%"

REM ::hornos=152     ccr_Gerdau LN Whitby.xls
REM call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_152.txt"  "152" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNWTB.zip" "%Carpeta%"

::hornos=152     ccr_Gerdau LN Whitby.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_152.txt"  "152" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNWTBEAF.zip" 

::hornos=165     ccr_Gerdau LN Whitby LMF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_165.txt"  "165" "2020-10-28" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNWTBLMF.zip" 

::Reunir todos los de Whitby en un ZiP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Gerdau LNGLNWTB" "%Carpeta%"

::hornos=172     ccr_Gerdau LN Wilton EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_172.txt"  "172" "2020-10-02" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau LNGLNWIL.zip" "%Carpeta%"


::--------------------Gerdau  ------------------------------------------
::hornos=46         ccr_Gerdau Corsa Tultitlan.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_46.txt"  "46" "2022-04-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_GerdauGCTUL.zip" "%Carpeta%"

::hornos=108         ccr_Gerdau Tuta.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_108.txt"  "108" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_GerdauTuta.zip" "%Carpeta%"


::--------------------Gerdau MacSteel ------------------------------------------
::hornos=148 y 149     ccr_Gerdau MacSteel Fort Smith EAF 3.xls, ccr_Gerdau MacSteel Fort Smith EAF 4.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_148 149.txt"  "148,149" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau MacSteelGMSFSEAF.zip" 

::hornos=173     ccr_Gerdau MacSteel Fort Smith LMF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_173.txt"  "173" "2020-07-21" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Gerdau MacSteelGMSFSLMF.zip" 

::Reunir los de GMFortS en un ZP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Gerdau MacSteelGMSFS" "%Carpeta%"

::--------------------Grupo Siderurgico Reyna, Sogamoso, Boyacá, Colombia -----------------------------------------
::hornos=215     ccr_Grupo Siderurgico Reyna.xls

::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_215.txt"  "215" "2022-08-27" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Grupo Siderurgico ReynaGSDR.zip" "%Carpeta%"


::--------------------Carpenter Technology ------------------------------------------
::hornos=80     ccr_Carpenter Reading.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_80.txt"  "80" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Carpenter TechnologyCTReading.zip" "%Carpeta%"


::hornos=137     ccr_Carpenter Latrobe.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_137.txt"  "137" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Carpenter TechnologyCTLatrobe.zip" "%Carpeta%"


::--------------------Cakratunggal Steel ----------------------------------------------
::hornos=159     ccr_Cakratunggal Steel.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_159.txt"  "159" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Cakratunggal SteelCakratuJaka.zip" "%Carpeta%"

::--------------------OEMK ----------------------------------------------
::hornos=191     ccr_OEMK EAF 1.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_191.txt"  "191" "2021-06-22" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMKOEMKEAF1.zip" 

::hornos=181     ccr_OEMK EAF 2.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_181.txt"  "181" "2020-10-30" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMKOEMKEAF2.zip" 

::hornos=162     ccr_OEMK EAF 3.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_162.txt"  "162" "2020-11-01" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMKOEMKEAF3.zip" 

::hornos=192     ccr_OEMK EAF 4.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_192.txt"  "192" "2021-02-08" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OEMKOEMKEAF4.zip" 

::Reunir los de OEMK en un ZIP
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_OEMKOEMK" "%Carpeta%"


::--------------------Outokumpu Steel ----------------------------------------------
::hornos=194     ccr_Outokumpu Stainless Calvert.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_194.txt"  "194" "2021-05-24" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OutokumpuOTKSCAL.zip" "%Carpeta%"



::--------------------North American Stainless ----------------------------------------------
::hornos=143     ccr_NAS.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_143.txt"  "143" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_North American StainlessNASGhent.zip" "%Carpeta%"

::--------------------Novacero Ecuador ----------------------------------------------
::hornos=84     ccr_Novacero EAF.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_84.txt"  "84" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_NovaceroNOVE.zip" "%Carpeta%"

::--------------------  Ovako  ------------------------------------------------------
::hornos=141     ccr_Ovako Hofors
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_141.txt"  "141" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_OvakooHofors.zip" "%Carpeta%"


::--------------------  SDI Pittsboro ------------------------------------------------------
::hornos=124     ccr_SDI Pittsboro
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_124.txt"  "124" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Steel Dynamics IncPitts.zip"

::hornos=40     ccr_SDI Columbia City South
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_40.txt"  "40" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Steel Dynamics IncSDICCSouth.zip"


::hornos=56     ccr_SDI Columbia City North
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_56.txt"  "56" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Steel Dynamics IncSDICCNorth.zip"


::Reunir los de SDICC en un ZP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Steel Dynamics IncSDICC" "%Carpeta%"


::hornos=146     ccr_SDIccr_SDI Columbus South
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_146.txt"  "146" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Steel Dynamics IncSDICOLSouth.zip"


::hornos=187     ccr_SDI Columbus North
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_187.txt"  "187" "2020-11-13" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Steel Dynamics IncSDICOLNorth.zip"


::Reunir los de SDICOL en un ZP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Steel Dynamics IncSDICOL" "%Carpeta%"


::--------------------Sidoc	Acopi-Yumbo, Valle del Cauca, Colombia --------------------------------------------------
::hornos=74     ccr_Sidoc Yumbo Planta 2 HAE.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_74.txt"  "74" "2021-06-15" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SidocYumbo2.zip" "%Carpeta%"



::--------------------Southern Steel Malaysia --------------------------------------------------
::hornos=157     ccr_Southern Steel Malaysia.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_157.txt"  "157" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Southern Steel MalaysiaSSMalaysia.zip" "%Carpeta%"

::--------------------SSAB Alabama --------------------------------------------------
::hornos=94,93  ccr_SSAB Alabama East Shell.xls,ccr_SSAB Alabama West Shell.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_94 93.txt"  "94,93" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_SSABSSAB.zip" "%Carpeta%"

::--------------------Alleima Sandviken ------------------------------------------------------
::hornos=123     ccr_Alleima Sandviken EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_123.txt"  "123" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_AlleimaALLSVK.zip" "%Carpeta%"

::-------------------- Standard Steel 	------------------------------------------------------
::hornos=127     ccr_Standard Steel.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_127.txt"  "127" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Standard SteelStdS.zip" "%Carpeta%"

::--------------------SulbBahrain ----------------------------------------------
::hornos=144     ccr_SULB.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_143.txt"  "144" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Sulb SteelSulbBahrain.zip" "%Carpeta%"

::-------------------- Tata Steel ------------------------------------------------------
::hornos=198     ccr_Tata Steel Bo Win Thailand EAF.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_198.txt"  "198" "2022-02-11" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tata SteelTSThaiNTS.zip" "%Carpeta%"

::-------------------- Tenaris Koppel------------------------------------------------------
::hornos=122     ccr_Tenaris Koppel.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_122.txt"  "122" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_TenarisTENKOP.zip" "%Carpeta%"

::-------------------- Tokio Steel ----------------------------------------------
::hornos=178     ccr_Tokyo Steel - Kyushu DC.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_178.txt"  "178" "2020-07-20" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tokyo SteelTSKYU.zip" "%Carpeta%"

::hornos=179     ccr_Tokyo Steel - Okayama DC.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_179.txt"  "179" "2020-08-12" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tokyo SteelTSOKA.zip" "%Carpeta%"


::hornos=184     ccr_Tokyo Steel - Tahara DC.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_184.txt"  "184" "2020-12-05" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Tokyo SteelTSTAH.zip" "%Carpeta%"


::-------------------- Vallourec Star Youngstown --------------------------------------------------
::hornos=88     ccr_ccr_Vallourec Star Youngstown.xls
call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_88.txt"  "88" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Vallourec StarVSY.zip" "%Carpeta%"

::-------------------- Yamato Steel ---------------------------------------------------------
::hornos=113         ccr_Yamato Steel.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_113.txt"  "113" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Yamato SteelYAMS.zip" "%Carpeta%"

::hornos=129         ccr_Yamato Korea Steel.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_129.txt"  "129" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Yamato SteelYKS.zip" "%Carpeta%"

::hornos=131        ccr_Siam Yamato Steel 1.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_131.txt"  "131" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Yamato SteelSYS1.zip"

::hornos=139        ccr_Siam Yamato Steel 2.xls
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraerVm2FALSE.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\Configuraciones\ZZZArchConfigVM2_139.txt"  "139" "2019-05-23" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr_Yamato SteelSYS2.zip"

::Reunir todos los de Yamato en un ZIP
::call "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\juntarVarios_2.bat" "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos" "ccr_Yamato SteelSYS" "%Carpeta%"

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

