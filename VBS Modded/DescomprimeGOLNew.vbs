Const robocopyFormat = "robocopy ""<ORIGEN>"" ""<DESTINO>"" <PARAMS>"
Const wzUnzipFormat = "wzunzip <PARAMS> ""<ORIGEN>"" ""<DESTINO>"""
Const Sincronizar = "D:\Sincronizar\zipGol\"
Const semaforo = "D:\Sincronizar\vm2\semaforoVM2.txt"
Const Plantas = "D:\Sincronizar\zipGol\Plantas\"
Const Users = "D:\sitio\users\"
Const auxZip = "D:\Sincronizar\zipGol\auxZip\"
Const paramWzUnzip = "-Jhrs -d"
Const ForWriting = 2
Const ForAppending = 8
Const ForReading = 1

'Const paramWzUnzip = "-Jhrs"

Dim paramsFormat, logFile
Dim wshShell
Dim fso, MyFile


    On Error Resume Next
    logFile = Sincronizar & "LogGOL.txt"
    paramsFormat = "/MIR /NFL /NDL /R:3 /LOG+:" & logFile
    Set fso = WScript.CreateObject("Scripting.FileSystemObject")


    Err.Clear
    Set MyFile = fso.OpenTextFile(semaforo, ForWriting)
    If Err.Number = 0 Then

        Set wshShell = WScript.CreateObject("WSCript.shell")
        Call main
        MyFile.Close
    End If
    Set fso = Nothing


Sub main()
    On Error Resume Next
	

    Dim fOri, fDest, dirUsers
    Dim cantidad, arrFiles

    ' Variable para ejecutar comandos
    Dim fso, folderPlanta, fd, fd2, fdPlantas, fil
    Dim fdd, fdi
    Dim filBorr()
    Dim contador, i
    Dim dirAnteriores, k, rutaF, rutaDest
	Dim rutaFinal
	Dim rep

    contador = -1
    cantidad = 100
    dirAnteriores = Sincronizar & "Anteriores"
    Set fso = WScript.CreateObject("Scripting.FileSystemObject")

    fOri = Plantas
    fDest = Sincronizar
	rep = auxZip
    
    dirUsers = Users

    Set fdPlantas = fso.GetFolder(fDest)
    for each fil in fdPlantas.files
 
        If LCase(Right(fil.Name, 4)) = ".zip" Then
			
            'Call execWzUnzip(fil.Path, fOri)
			Call execWzUnzip(fil.Path, fOri)
			
            contador = contador + 1
            ReDim Preserve filBorr(contador)
            filBorr(contador) = fil.Path
	'msgbox "fil.Path" & fil.Path
	'msgbox "fOri" & fOri
  
            Set folderPlanta = fso.GetFolder(fOri)
            For Each fd In folderPlanta.subfolders
                Set fdi = fso.GetFolder(fd.Path & "\Informes\")
                For Each fdd In fdi.subfolders
                    rutaF = fdd.Path
		'msgbox "fdi" & fdi
		'msgbox "rutaF" & rutaF
 				
                    If fso.FolderExists(rutaF) Then
                        Set fd2 = fso.GetFolder(rutaF)
						'msgbox "1" & fd2
                    Else
                        Set fd2 = fso.CreateFolder(rutaF)
						'msgbox "2" & fd2
                    End If
					'rutaFinal = mid(rutaF,15)
                    'rutaDest = Users & rutaFinal
                    rutaDest = Users & Mid(rutaF, Len(fOri) + 1)
					'msgbox "0 " & rutaF
					'msgbox "1 " & rutaDest
				
                    Call execRobocopy(fd2.Path, rutaDest)
' Hacer todos los GIF Copiados Transparentes
					''Modificacion para que no haga el gif de eventos transparente
					Call renombrar(rutaDest, "Eventos.gif")
				
					Call renombrar(rutaDest, "Eventos.txt")
' Agregar linea de control.txt
                    Call agregaLineaControl(fd.Path & "\Informes\", Users & "\" & fd.Name & "\Informes\")
                Next
            Next
			call actualizarSQL
			'call CrearXMLDashboards
			'call copiarEventosVacios
            fso.deletefolder auxZip
            fso.moveFile filBorr(contador), dirAnteriores & "\"
        End If
	next  


    ' BORRAR ARCHIVOS EXTRAS (solo dejar los 100 archivos mas nuevos)
    If contador > -1 Then
        arrFiles = getFileArray(dirAnteriores, "")
        k = UBound(arrFiles)
        If k >= cantidad Then
            ' Ordenar el arreglosdf
            Call QuickSort(arrFiles, 0, k)

            ' Hay que borrar algunos archivos
            For i = cantidad To k
                Call borrarArchivo(dirAnteriores, arrFiles(i - cantidad))
            Next
        End If
    End If

    Set wshShell = Nothing
    
End Sub


' execWzUnzip:
' Ejecuta el comando de execWzUnzip desde un CommandLine
'   origen -> String, Ruta completa de origen
'   destino -> String, Ruta completa de destino
Sub execWzUnzip(Origen, destino)
If Not blnDebug Then On Error Resume Next

    Dim cmdWzUnzip
    
    cmdWzUnzip = Replace(wzUnzipFormat, "<ORIGEN>", Origen)
    cmdWzUnzip = Replace(cmdWzUnzip, "<DESTINO>", destino)
    cmdWzUnzip = Replace(cmdWzUnzip, "<PARAMS>", paramWzUnzip)

    wshShell.Run cmdWzUnzip, 1, True
    
End Sub

' execRobocopy:
' Ejecuta el comando de robocopy desde un CommandLine
'   origen -> String, Ruta completa de origen
'   destino -> String, Ruta completa de destino
Sub execRobocopy(Origen, destino)
If Not blnDebug Then On Error Resume Next

    Dim comando
    
    comando = Replace(robocopyFormat, "<ORIGEN>", Origen)
    comando = Replace(comando, "<DESTINO>", destino)
    comando = Replace(comando, "<PARAMS>", paramsFormat)
    
    wshShell.Run comando, 1, True
End Sub

' execMogrify:
' Ejecuta el comando de execMogrify desde un CommandLine para dejar GIF con Transparencia
'   destino -> String, Ruta completa de destino
Sub execMogrify(destino)
If Not blnDebug Then On Error Resume Next

    Dim comando
   If Right(destino,1)<>"\" Then destino=destino & "\"
    comando = Replace(mogrifyFormat, "<DESTINO>", destino)

	wshShell.Run comando, 1, True
End Sub

'Renombrar el gif de aventos para evitar el uso de Mogrify
Sub renombrar(ruta, nombreArch)
	Dim nombreOriginal
	Dim nombreNuevo 
		
	If InStr(nombreArch, ".gif") > 0 Then
		nombreOriginal = ruta & "\" &  nombreArch
		nombreNuevo = ruta & "\Eventos.txt"
		CreateObject("Scripting.FileSystemObject").MoveFile nombreOriginal, nombreNuevo

	Else 
		nombreOriginal = ruta &"\"& nombreArch
		nombreNuevo = ruta & "\Eventos.gif"
		CreateObject("Scripting.FileSystemObject").MoveFile nombreOriginal, nombreNuevo
	End If
	

End sub


Sub agregaLineaControl(Origen, destino)
    Dim salir
    Dim objFileOri, objFileDest, objFileDest2, ctrlFileOri, ctrlFileDest, ctrlFileDest2
    Dim linOri, linDest, linDest2
    Dim linoriNew(), i, n, arr, idHorno(), seUso(), agrego
    On Error Resume Next
    
    ' Agrega linea en archivo de control
        ctrlFileOri = Origen & "control.txt"
        Set objFileOri = fso.OpenTextFile(ctrlFileOri, ForReading)
        linOri = ""
        salir = False
        n = -1
        Do
            linOri = objFileOri.ReadLine
            If InStr(linOri, "GasOnLine") > 0 Then
                n = n + 1
                ReDim Preserve linoriNew(n)
                ReDim Preserve idHorno(n)
                ReDim Preserve seUso(n)
                linoriNew(n) = linOri
				arr=Split(linOri,"|@&88")
				idHorno(n)=arr(3)
				seUso(n)=False 
            End If
        Loop Until esFinal(objFileOri)
        objFileOri.Close
        ctrlFileDest = destino & "control.txt"
        ctrlFileDest2 = destino & "ZZZcontrol.txt"
        fso.moveFile ctrlFileDest, ctrlFileDest2
        Set objFileDest2 = fso.OpenTextFile(ctrlFileDest2, ForReading)
        Set objFileDest = fso.OpenTextFile(ctrlFileDest, ForWriting, True)
        
        Do While Not (esFinal(objFileDest2))
            linDest2 = objFileDest2.ReadLine
            If InStr(linDest2, "GasOnLine") <= 0 Then
                objFileDest.WriteLine linDest2
			Else
				arr=Split(linDest2,"|@&88")
				agrego=false
				For i=0 To n
					If idHorno(i)=arr(3) then
						objFileDest.WriteLine linOriNew(i)
						seUso(i)=True 
						agrego=true
 						Exit For
					End if
				Next 
				if not agrego then
					objFileDest.WriteLine linDest2
				end if
            End If
        Loop
        For i = 0 To n
			If Not seUso(n) then
	            objFileDest.WriteLine linoriNew(i)
			End if
        Next
        objFileDest.Close
        objFileDest2.Close
        fso.DeleteFile (ctrlFileDest2)
End Sub
Function esFinal(arch)
	On Error Resume Next
	Dim res
	res = True
	res = (arch.AtEndOfStream = True)
	esFinal = res
End Function

Function getFileArray(carpeta, prefijo)
    Dim resp

    Dim i
    Dim blnValido
    Dim fso, fo, file

    i = -1
    ReDim resp(-1)
    Set fso = WScript.CreateObject("Scripting.FileSystemObject")

    If fso.FolderExists(carpeta) Then
        Set fo = fso.GetFolder(carpeta)

        ' Procesar cada archivo
        For Each file In fo.Files
            blnValido = False

            ' Empiezan con el mismo nombre
            blnValido = blnValido Or Left(file.Name, Len(prefijo)) = prefijo

            If blnValido Then
                i = i + 1
                ReDim Preserve resp(i)
                resp(i) = file.Name
            End If
        Next

        Set fo = Nothing
    End If
    Set fso = Nothing

    getFileArray = resp
End Function

Sub QuickSort(avarValues, iavarValuesFirst, iavarValuesLast)
    Dim iavarValuesPivot
    Dim iavarValuesSwapFirst
    Dim iavarValuesSwapLast
    Dim varSwap
      
    If iavarValuesLast - iavarValuesFirst = 1 Then
        If avarValues(iavarValuesFirst) > avarValues(iavarValuesLast) Then
            varSwap = avarValues(iavarValuesFirst)
            avarValues(iavarValuesFirst) = avarValues(iavarValuesLast)
            avarValues(iavarValuesLast) = varSwap
        End If
    End If
      
    iavarValuesPivot = avarValues((iavarValuesFirst + iavarValuesLast) \ 2)
    avarValues((iavarValuesFirst + iavarValuesLast) \ 2) = avarValues(iavarValuesFirst)
    avarValues(iavarValuesFirst) = iavarValuesPivot
    iavarValuesSwapFirst = iavarValuesFirst + 1
    iavarValuesSwapLast = iavarValuesLast
      
    Do
        Do While iavarValuesSwapFirst < iavarValuesSwapLast _
            And avarValues(iavarValuesSwapFirst) <= iavarValuesPivot
            iavarValuesSwapFirst = iavarValuesSwapFirst + 1
        Loop
        Do While avarValues(iavarValuesSwapLast) > iavarValuesPivot
            iavarValuesSwapLast = iavarValuesSwapLast - 1
        Loop
        If iavarValuesSwapFirst < iavarValuesSwapLast Then
            varSwap = avarValues(iavarValuesSwapFirst)
            avarValues(iavarValuesSwapFirst) = avarValues(iavarValuesSwapLast)
            avarValues(iavarValuesSwapLast) = varSwap
        End If
    Loop While iavarValuesSwapFirst < iavarValuesSwapLast
      
    avarValues(iavarValuesFirst) = avarValues(iavarValuesSwapLast)
    avarValues(iavarValuesSwapLast) = iavarValuesPivot
      
    If iavarValuesFirst < (iavarValuesSwapLast - 1) Then
        Call QuickSort(avarValues, iavarValuesFirst, iavarValuesSwapLast - 1)
    End If
    If iavarValuesSwapLast + 1 < iavarValuesLast Then
        Call QuickSort(avarValues, iavarValuesSwapLast + 1, iavarValuesLast)
    End If
End Sub

Sub borrarArchivo(carpeta, archivo)
    Dim fullFileName
    Dim fso, fo, file

    Set fso = WScript.CreateObject("Scripting.FileSystemObject")
    fullFileName = carpeta & "\" & archivo
    If fso.fileExists(fullFileName) Then
        Call fso.DeleteFile(fullFileName, True)
    End If
End Sub

Sub moveFile(carpetaOrigen, archivo, carpetaDestino)
    Dim fullFileName
    Dim fso, fo, file

    Set fso = WScript.CreateObject("Scripting.FileSystemObject")
    fullFileName = carpetaOrigen & archivo
    If fso.fileExists(fullFileName) Then
Call escribeLog(fso, ">>>> moveFile >> " & fullFileName & "  a  " & carpetaDestino)
        fso.moveFile fullFileName, carpetaDestino
    End If
End Sub

Sub escribeLog(fso, texto)
    Dim objFile
    Set objFile = fso.OpenTextFile(logFile, ForAppending, True)
    objFile.WriteLine ("(" & Now & "):" & texto)
    objFile.Close
End Sub

sub actualizarSQL()
	dim objFSO, objShell , strCommand,strInput, strOut,intReturn
'	on error resume  next
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	Set objShell = CreateObject("WScript.Shell")
	strInput= "D:\Sincronizar\zipGOL\sqlGOL.txt"
	strOut= "D:\Sincronizar\zipGol\sqlGOLSalida.txt"

	If objFSO.FileExists(strInput) = True Then
		'strCommand = "sqlcmd -S txcare-sql.database.windows.net -U fmariscal -P Pancho49193@2 -d txCare -i " & strInput & " -o " & strOut
		'intReturn = objShell.Run(strCommand, 1, True)
	End If
end sub

sub CrearXMLDashboards
Dim objShell, rutaCrearXML
on error resume next
rutaCrearXML = "D:\Sitio\Scripts\creaXmlGeneral.vbs"
Set objShell = Wscript.CreateObject("WScript.Shell")

'objShell.Run rutaCrearXML 

' Using Set is mandatory
Set objShell = Nothing
end sub

sub copiarEventosVacios
Dim objShell, ruta
on error resume next
ruta = "D:\Sincronizar\GifEventos\CopiarEventosGIFSincronizarASitio.vbs"
Set objShell = Wscript.CreateObject("WScript.Shell")

'objShell.Run ruta

' Using Set is mandatory
Set objShell = Nothing
end sub


