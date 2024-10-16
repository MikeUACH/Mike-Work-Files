Option Explicit

' actualizaBDGOL:
'   Fecha de creación: 23 Agosto 2020
'   Francisico Mariscal
'   Procesa acciones de GasOnLine

Dim carpeta
Dim conn
Dim archivoProceso
Dim fso
Dim Arg, accion, comboKey
Dim FileGOL,furnaceID,Tank,FechaExportar,Directorio
	carpeta = "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\"
	archivoProceso = "ProcesaExtraccionesGOL.bat"
	Set Arg = WScript.Arguments
	accion = Arg(0)
	Set fso = CreateObject("Scripting.FileSystemObject")
	Set conn = getDBConnXML()
	if accion="PROCESAR" then
		Call ponerProcesar(fso)
	elseif accion="PROCESO" then
		comboKey = Arg(1)
		call marcaProceso(comboKey)
	elseif accion="GRABAR" then
		comboKey = Arg(1)
		FileGOL = Arg(2)
		furnaceID = Arg(3)
		Tank = Arg(4)
		FechaExportar = Arg(5)
		Directorio = Arg(6)
		call grabar(comboKey,FileGOL,furnaceID,Tank,FechaExportar,Directorio)
	end if 
	conn.close
	
Sub ponerProcesar(fso)
'	exec sp_ActualizaPlantasGOL 'PROCESAR'
'resultado	comando
'OK	D:|cd D:\Sincronizar\VM2\extraerCCR\GasInOilExporter|del "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\salida\gas-in-oil_Gerdau LN Jackson_1_*"|VM2_GasInOil_Exporter_multiTank_072020.exe "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\salida" "44" "2020-08-05" "1"|del "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\ArchivosXLS\gas-in-oil_Gerdau LN Jackson_1_*"|move /y "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\salida\gas-in-oil_Gerdau LN Jackson_1_*" "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\ArchivosXLS\"|D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\actualizaBDGOL.vbs "PROCESO","GLNJKS_EAF_7002990_LTC"|
    Dim sql
    Dim rs
    Dim idCorp, Fecha
	Dim resultado,comando

    On Error Resume Next

    sql= "exec sp_ActualizaPlantasGOL 'PROCESAR'"
    Set rs = SQLQuery(conn, sql)
    Do While hayDatos(rs)
        resultado = rs("resultado")
        comando = rs("comando")
		if resultado="OK" then
			call agregaProcesar(fso,comando)
		end if
        rs.movenext
    Loop
    rs.Close
End Sub


Sub agregaProcesar(fso,comando)
'resultado	comando
'	D:
' cd D:\Sincronizar\VM2\extraerCCR\GasInOilExporter
' del "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\salida\gas-in-oil_Gerdau LN Jackson_1_*"
' VM2_GasInOil_Exporter_multiTank_072020.exe "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\salida" "44" "2020-08-05" "1"
' del "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\ArchivosXLS\gas-in-oil_Gerdau LN Jackson_1_*"
' move /y "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\salida\gas-in-oil_Gerdau LN Jackson_1_*" "D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\ArchivosXLS\"
' D:\Sincronizar\VM2\extraerCCR\GasInOilExporter\actualizaBDGOL.vbs "PROCESO","GLNJKS_EAF_7002990_LTC"
	Dim comandoLoc
	Dim fts
	Dim archivo
	archivo=carpeta & archivoProceso 
	If fso.FileExists(archivo) Then
        Set fts = fso.OpenTextFile(archivo, 8, True) ' ForAppending
    Else
        Set fts = fso.OpenTextFile(archivo, 2, True)' ForWriting
    End If
	comandoLoc=replace(comando,"|",Chr(10))
    fts.WriteLine comandoLoc
    fts.Close
End Sub

sub marcaProceso(comboKey)
'	exec sp_ActualizaPlantasGOL 'PROCESO','combokey'
    Dim sql
    Dim rs
    Dim idCorp, Fecha
	Dim resultado,comando

    On Error Resume Next

    sql= "exec sp_ActualizaPlantasGOL 'PROCESO','" & comboKey & "'"

    Set rs = SQLQuery(conn, sql)

    rs.Close
end sub

sub grabar(comboKey, FileGOL, furnaceID, Tank, FechaExportar, Directorio)
    Dim sql
    Dim rs
    Dim idCorp, Fecha
    Dim resultado, comando
    Dim lastUnderscorePosition

    On Error Resume Next

    ' Ensure FileGOL follows the correct format
    lastUnderscorePosition = InStrRev(FileGOL, "_")
    If lastUnderscorePosition = Len(FileGOL) Then
        ' If FileGOL ends with an underscore, append the tank number and another underscore
        FileGOL = FileGOL & Tank & "_"
    ElseIf lastUnderscorePosition = 0 Then
        ' If FileGOL does not contain an underscore, append the tank number with underscores
        FileGOL = FileGOL & "_" & Tank & "_"
    Else
        ' If FileGOL contains underscores but does not end with one, append the tank number and another underscore
        If Mid(FileGOL, lastUnderscorePosition + 1) = "" Then
            FileGOL = FileGOL & Tank & "_"
        Else
            FileGOL = Left(FileGOL, lastUnderscorePosition) & Tank & "_"
        End If
    End If

    sql = "exec sp_ActualizaPlantasGOL 'GRABAR','" & comboKey & "','" & FileGOL & "','" & furnaceID & "','" & Tank & "','" & FechaExportar & "','" & Directorio & "'"

    Set rs = SQLQuery(conn, sql)
    rs.Close
end sub


' SQLQuery:
' Ejecuta una query SQL y regresa un Recordset
Function SQLQuery(cnnDB, queryStr)
    Dim adoRec

    On Error Resume Next
  
    Set adoRec = CreateObject("ADODB.Recordset")
    adoRec.ActiveConnection = cnnDB
    adoRec.CursorType = 3 ' 3 -> adOpenStatic
    adoRec.Open (queryStr)

    Set SQLQuery = adoRec
End Function

' hayDatos:
' Verifica si hay datos en un RecordSet
'   objRS -> Objeto, RecordSet a Verificar
'####################################
Function hayDatos(objRS)
    On Error Resume Next
    Dim blnResp
    blnResp = False
    blnResp = Not objRS.EOF
    hayDatos = blnResp
End Function


Function estaVacio(cadena)
    Dim flag
    flag = False

    flag = IsNull(cadena)
    If Not flag Then flag = IsEmpty(cadena)
    If Not flag Then flag = Trim(cadena) = ""
    If Not flag Then flag = Len(cadena) = 0

    estaVacio = flag
End Function


Function valorDB(conn, valor, tabla, condicion)
    Dim resp, k
    Dim rs, sql


    resp = ""
    If Not (estaVacio(valor) Or estaVacio(tabla)) Then
        Set rs = CreateObject("ADODB.Recordset")
        sql = "select " & valor & " from " & tabla

        If Not estaVacio(condicion) Then sql = sql & " where " & condicion
        rs.Open sql, conn
        If hayDatos(rs) Then
            ' Por si el "valor" es un seudonimo 'count(algo) as X'
            k = InStr(1, valor, " as ", 1)
            If k > 0 Then
                valor = Mid(valor, k + 4)
            Else
                ' Por si el "valor" incluye prefijo 'T.name'
                k = InStr(valor, ".")
                If k > 0 Then valor = Mid(valor, k + 1)
            End If
            
            resp = rs(valor)
        End If
        rs.Close
        Set rs = Nothing
    End If

    valorDB = resp
End Function

Function getDBConnXML()
    Dim conexion
    Dim connBDAmigeXML
'    conexion = "DRIVER={SQL Server};Server=10.0.1.20;Database=TxcareDB_V3;Uid=Txcare;pwd=1257amf;"
'	conexion = "Provider=SQLOLEDB.1;Password=Pancho49193@2;Persist Security Info=True;User ID=fmariscal;Initial Catalog=txcare;Data Source=txcare-sql.database.windows.net"   
    conexion = "DRIVER={SQL Server};Server=txcare-sql.database.windows.net;Database=Txcare;Uid=fmariscal;pwd=Pancho49193@2;"
'	conexion = "DRIVER={ODBC Driver 11 for SQL Server};SERVER=txcare-sql.database.windows.net;DATABASE=txcare;UID=fmariscal:PWD=Pancho49193@2"

    Set connBDAmigeXML = CreateObject("ADODB.Connection")
    connBDAmigeXML.Mode = 3
    connBDAmigeXML.CommandTimeout = 3600
    connBDAmigeXML.ConnectionTimeout = 3600
    connBDAmigeXML.Open (conexion)
    Set getDBConnXML = connBDAmigeXML
End Function

