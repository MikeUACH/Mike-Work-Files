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
    dirAnteriores = Sincronizar & "Anteriores\"
    Set fso = WScript.CreateObject("Scripting.FileSystemObject")

    fOri = AddTrailingBackslash(Plantas)
    fDest = AddTrailingBackslash(Sincronizar)
    rep = AddTrailingBackslash(auxZip)
    
    dirUsers = AddTrailingBackslash(Users)

    Set fdPlantas = fso.GetFolder(fDest)
    For Each fil In fdPlantas.files
        If LCase(Right(fil.Name, 4)) = ".zip" Then
            ' Registrar la operación de descompresión
            Call escribeLog(fso, "Descomprimiendo archivo: " & fil.Name & " en " & fOri)
            Call execWzUnzip(fil.Path, fOri)
			
            ' Procesar los archivos descomprimidos
            Set folderPlanta = fso.GetFolder(fOri)
            For Each fd In folderPlanta.subfolders
                Set fdi = fso.GetFolder(fd.Path & "\Informes\")
                For Each fdd In fdi.subfolders
                    rutaF = AddTrailingBackslash(fdd.Path)
                    If fso.FolderExists(rutaF) Then
                        Set fd2 = fso.GetFolder(rutaF)
                    Else
                        Set fd2 = fso.CreateFolder(rutaF)
                    End If
                    ' Ajusta la ruta de destino
                    rutaDest = Replace(rutaF, fOri, dirUsers)
                    ' Asegúrate de que la ruta de destino tenga la estructura correcta
                    If Not fso.FolderExists(rutaDest) Then
                        fso.CreateFolder(rutaDest)
                    End If
                    Call execRobocopy(fd2.Path, rutaDest)
                    
                    Call renombrar(rutaDest, "Eventos.gif")
                    Call renombrar(rutaDest, "Eventos.txt")
                    
                    Call agregaLineaControl(fd.Path & "\Informes\", dirUsers & fd.Name & "\Informes\")
                Next
            Next
            Call actualizarSQL
            
            ' Elimina la carpeta auxiliar si existe
            If fso.FolderExists(auxZip) Then 
                fso.DeleteFolder auxZip
                Call escribeLog(fso, "Carpeta auxiliar auxZip eliminada")
            Else
                Call escribeLog(fso, "La carpeta auxiliar auxZip no existe")
            End If
            
            ' Mueve el archivo .zip procesado a la carpeta Anteriores
            fso.MoveFile fil.Path, dirAnteriores & fil.Name
            Call escribeLog(fso, "Archivo .zip movido a Anteriores: " & dirAnteriores & fil.Name)
			
            ' Mueve los archivos descomprimidos a la carpeta de destino final
            Call moveFile(fOri, "*", dirUsers)
        Else
            Call escribeLog(fso, "Archivo no es .zip, se omite: " & fil.Name)
        End If
    Next

    If contador > -1 Then
        arrFiles = getFileArray(dirAnteriores, "")
        k = UBound(arrFiles)
        If k >= cantidad Then
            Call QuickSort(arrFiles, 0, k)
            For i = cantidad To k
                Call borrarArchivo(dirAnteriores, arrFiles(i - cantidad))
            Next
        End If
    End If

    Set wshShell = Nothing
End Sub

Sub execWzUnzip(Origen, destino)
    If Not blnDebug Then On Error Resume Next
    Dim cmdWzUnzip

    cmdWzUnzip = Replace(wzUnzipFormat, "<ORIGEN>", Origen)
    cmdWzUnzip = Replace(cmdWzUnzip, "<DESTINO>", destino)
    cmdWzUnzip = Replace(cmdWzUnzip, "<PARAMS>", paramWzUnzip)

    wshShell.Run cmdWzUnzip, 1, True
    Call escribeLog(fso, "Comando de descompresión ejecutado: " & cmdWzUnzip)
End Sub


Sub execRobocopy(Origen, destino)
    If Not blnDebug Then On Error Resume Next
    Dim comando

    comando = Replace(robocopyFormat, "<ORIGEN>", Origen)
    comando = Replace(comando, "<DESTINO>", destino)
    comando = Replace(comando, "<PARAMS>", paramsFormat)

    Call escribeLog(fso, "Ejecutando comando robocopy: " & comando)
    wshShell.Run comando, 1, True

    If fso.FolderExists(destino) Then
        Call escribeLog(fso, "Archivos copiados correctamente a " & destino)
    Else
        Call escribeLog(fso, "Error: No se copiaron archivos a " & destino)
    End If
End Sub

Function AddTrailingBackslash(ruta)
    If Right(ruta, 1) <> "\" Then
        AddTrailingBackslash = ruta & "\"
    Else
        AddTrailingBackslash = ruta
    End If
End Function

Sub renombrar(ruta, nombreArch)
    Dim nombreOriginal, nombreNuevo
    Dim fso

    Set fso = CreateObject("Scripting.FileSystemObject")

    If InStr(nombreArch, ".gif") > 0 Then
        nombreOriginal = ruta & "\" & nombreArch
        nombreNuevo = ruta & "\Eventos.txt"
        If fso.FileExists(nombreOriginal) Then
            fso.MoveFile nombreOriginal, nombreNuevo
            Call escribeLog(fso, "Archivo renombrado de " & nombreOriginal & " a " & nombreNuevo)
        Else
            Call escribeLog(fso, "Error: Archivo no encontrado para renombrar: " & nombreOriginal)
        End If
    Else
        nombreOriginal = ruta & "\" & nombreArch
        nombreNuevo = ruta & "\Eventos.gif"
        If fso.FileExists(nombreOriginal) Then
            fso.MoveFile nombreOriginal, nombreNuevo
            Call escribeLog(fso, "Archivo renombrado de " & nombreOriginal & " a " & nombreNuevo)
        Else
            Call escribeLog(fso, "Error: Archivo no encontrado para renombrar: " & nombreOriginal)
        End If
    End If
End Sub

Sub agregaLineaControl(Planta, ctrUsers)
    Dim salir
    Dim objFilePlanta, objFileSitioUsers, objFileSitioUsers2, ctrlFileOri, ctrlUsuarioSitio, ctrlUsuarioSitio2
    Dim linOri, linDest, linDest2
    Dim linoriNew(), i, n, arr, idHorno(), seUso(), agrego
    On Error Resume Next

    ctrlFilePlanta = Planta & "control.txt"
    Set objFilePlanta = fso.OpenTextFile(ctrlFilePlanta, ForReading)

    ctrlUsuarioSitio = ctrUsers & "control.txt"
    Set objFileSitioUsers = fso.OpenTextFile(ctrlUsuarioSitio, ForReading)

    ctrlUsuarioSitio2 = ctrUsers & "ZZZcontrol.txt"
    Set objFileSitioUsers2 = fso.OpenTextFile(ctrlUsuarioSitio2, ForWriting, True)

    Do
        linOri = objFileSitioUsers.ReadLine
        If InStr(linOri, "|@&88|@&") <= 0 Then
            objFileSitioUsers2.WriteLine linOri
        End If
    Loop Until esFinal(objFileSitioUsers)
    objFileSitioUsers.Close

    Do
        linOri = objFilePlanta.ReadLine
        objFileSitioUsers2.WriteLine linOri
    Loop Until esFinal(objFilePlanta)
    objFilePlanta.Close

    objFileSitioUsers2.Close

    fso.DeleteFile (ctrlUsuarioSitio)
    fso.MoveFile ctrlUsuarioSitio2, ctrlUsuarioSitio
End Sub

Function esFinal(arch)
    On Error Resume Next
    Dim res
    res = True
    res = (arch.AtEndOfStream = True)
    esFinal = res
End Function

Function getFileArray(ByVal folderPath, ByVal fileType)
    On Error Resume Next
    Dim folder, file, arrFiles(), count
    Set folder = fso.GetFolder(folderPath)

    count = 0
    For Each file In folder.Files
        If fileType = "" Or LCase(Right(file.Name, Len(fileType))) = LCase(fileType) Then
            ReDim Preserve arrFiles(count)
            arrFiles(count) = file.Name
            count = count + 1
        End If
    Next
    getFileArray = arrFiles
End Function

Sub QuickSort(arr, low, high)
    Dim i, j, pivot, temp

    i = low
    j = high
    pivot = arr((low + high) \ 2)

    Do While i <= j
        Do While arr(i) < pivot
            i = i + 1
        Loop
        Do While arr(j) > pivot
            j = j - 1
        Loop
        If i <= j Then
            temp = arr(i)
            arr(i) = arr(j)
            arr(j) = temp
            i = i + 1
            j = j - 1
        End If
    Loop

    If low < j Then QuickSort arr, low, j
    If i < high Then QuickSort arr, i, high
End Sub

Sub borrarArchivo(ruta, archivo)
    On Error Resume Next
    Dim fil

    fil = ruta & "\" & archivo

    fso.DeleteFile fil, True
    Call escribeLog(fso, "Archivo borrado: " & fil)
End Sub

Sub escribeLog(fso, texto)
    On Error Resume Next
    Dim MyFile
    Set MyFile = fso.OpenTextFile(logFile, ForAppending, True)
    MyFile.WriteLine(Now() & " - " & texto)
    MyFile.Close
End Sub

Sub moveFile(Origen, files, Destino)
    On Error Resume Next
    Dim comando

    comando = "move " & Origen & files & " " & Destino
    Call escribeLog(fso, "Moviendo archivos de " & Origen & " a " & Destino)
    wshShell.Run comando, 1, True
End Sub

Sub actualizarSQL()
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
End Sub



Sub CrearXMLDashboards()
	Dim objShell, rutaCrearXML
	on error resume next
	rutaCrearXML = "D:\Sitio\Scripts\creaXmlGeneral.vbs"
	Set objShell = Wscript.CreateObject("WScript.Shell")

	'objShell.Run rutaCrearXML 

	' Using Set is mandatory
	Set objShell = Nothing
End Sub

Sub copiarEventosVacios()
	Dim objShell, ruta
	on error resume next
	ruta = "D:\Sincronizar\GifEventos\CopiarEventosGIFSincronizarASitio.vbs"
	Set objShell = Wscript.CreateObject("WScript.Shell")

	'objShell.Run ruta

	' Using Set is mandatory
	Set objShell = Nothing
End Sub
