Sub actualizaSummaryVM2(wbRepEj As Workbook)
On Error Resume Next
Dim sh As Worksheet
Dim wbNew As Workbook
Dim rg As Excel.Range
Dim rgV As Excel.Range
Dim celda As Excel.Range
Dim rgIdCust As Excel.Range
Dim rgBk As Excel.Range
Dim rgSel As Excel.Range
Dim rgRangeDefRep As Excel.Range
Dim rgRepLimit As Excel.Range
Dim rgRangeDefAux As Excel.Range
Dim rgHideRows As Excel.Range
Dim rgHideColumns As Excel.Range
Dim rgHeaders As Excel.Range
Dim rgHeaders1 As Excel.Range
Dim rgHeaders2 As Excel.Range
Dim rgnTooltip As Excel.Range
Dim rgDatos As Excel.Range
Dim rgDatosAux As Excel.Range
Dim rgValoresAux As Excel.Range
Dim rgVisible As Excel.Range
Dim rgFormato As Excel.Range
Dim rgTitulo As Excel.Range
Dim rgTit1 As Excel.Range
Dim rgTooltip As Excel.Range
Dim rgCMBK As Excel.Range
Dim rgHeadersRep As Excel.Range
Dim rgDatosAuxRep As Excel.Range
Dim rgDatosRep As Excel.Range
Dim rgDatosTotalRep As Excel.Range
Dim rgFurnaceRep As Excel.Range
Dim rgFurnace As Excel.Range
Dim rgRepLimitRep As Excel.Range
Dim rgRangeDefAux2 As Excel.Range
Dim rgRangeDefRep2 As Excel.Range
Dim rgLocalNameRep As Excel.Range
Dim rgLocalName As Excel.Range
Dim rgItemRg As Excel.Range
Dim rgItemRep As Excel.Range
Dim rgTxUnitRg As Excel.Range
Dim rgTxUnit As Excel.Range
Dim txUnit As String
Dim nmPlant As String
Dim furN As String
Dim itemRep As String
Dim locNm As String
Dim idFech As Integer
Dim cmbKey As String
Dim x As Integer
Dim rgCmbKeyRg As Excel.Range
Dim rgCmbKeyRep As Excel.Range
Dim strRS As String
Dim valorTit As String
Dim valorTitulo1() As String
Dim nombreTitulo1() As String
Dim valTit1 As String
Dim nombTit1 As String
Dim nombTitAnt As String
Dim valorTooltip As String
Dim colorLetra As String
Dim colorFondo As String
Dim colorL1 As String
Dim colorF1 As String
Dim contr As Integer, contSh As Integer
Dim dict As Dictionary
Dim nmVal As Variant
Dim arrComp() As Variant
Dim arrRG() As Variant, arrVal() As Variant
Dim col As Integer, i As Integer, j As Integer
Dim irA As String
Dim orden As Integer
Dim nombreRango As String
Dim alinear As String
Dim tipoArchivo As String
Dim llave As String
Dim arr() As Excel.Range
Dim n As Integer
Dim rgH As Excel.Range
Dim pos As Integer
Dim sep As String
Dim filetextStreamSql As TextStream
Dim rutaSitio2 As String
Dim striTxt As String
Dim striTxt2 As String
Dim strID As String
Dim strRango As String
Dim idRMDSSummary As Integer
Dim esFecha As Boolean
Dim nombreHoja As String
Dim nm As Variant
Dim shLanguage As String
Dim noHaBorrado As Boolean
Dim esComboKey As Boolean
Dim vis As Integer
Dim rgDatosTotal As Excel.Range
Dim rgComboKeyREP As Excel.Range
Dim rgComboKey As Excel.Range
Dim auxSave As Variant
Dim f As Integer
Dim Row As Object
Dim sep1 As String
Dim sep2 As String
Dim strToBD As String
Dim summStr As String
Dim rgRowVisible As Excel.Range
Dim rgColVisible As Excel.Range
Dim rgLblAmi As Excel.Range
Dim rgSrcFilerg As Excel.Range
Dim rgSrcFile As Excel.Range
Dim rgTitleReport As Excel.Range
Dim esVisible As Boolean
Dim nmWS As String
Dim ruta As String
Dim dir As String
Dim dir2 As String
Dim rutaComp As String
Dim idCorp As String
Dim rutaWS As String, archWS As String
Dim arrCorp As Variant, arrRuta As Variant, arrPlant As Variant, nmZip As Variant
Dim w As Integer
Dim version As String
Dim srcFile As String
Dim rgHideRowsRep As Excel.Range
Dim rgHideColumnsRep As Excel.Range
Dim rgHideRowsRg As Excel.Range
Dim rgHideColumnsRg As Excel.Range
Dim rgItemId As Excel.Range
Dim rgItemIdVis As Excel.Range
Dim visRep As String, visRep2 As Integer
Dim contS As Integer
Dim contArch As Integer
Dim contOrden As Integer
Dim contNombreRg As Integer
Dim siFold As Boolean
Dim ordRow As Integer
Dim PSN As String
Dim EAF As String
Dim lastRow As Long
Dim lastCol As Long
Dim rgRep_Prev As Range
Dim rgHdrPrev As Range
Dim rgTitPrev As Range
Dim rgDef As Range
Dim rgVisPrev As Range
Dim rgColVisPrev As Range
Dim y As Integer
Dim z As Integer
Dim t As Integer
Dim s As Integer
Dim k As Integer
Dim rgDireccion As Excel.Range
Dim rgSelector As Excel.Range
Dim rgSelX As Excel.Range
Dim dictPSN As Dictionary
Dim arrEAF() As Variant
Dim dPSN As Integer
Dim dEAF As Integer
Dim kk As Integer
Dim driveAce As String
Dim driveLoc As String
Dim rutaServidor As String, rutaLocal As String
Dim fso As New FileSystemObject
Dim fldServ As folder, fldLocal As folder
Dim filServ As file, filLocal As file
Dim arrFilServ() As file, arrFilLocal() As file
Dim nFilServ As Integer, nFilLocal As Integer
Dim ii As Integer, jj As Integer, pos2 As Integer
Dim nombreServidor As String
Dim sptDireccion As String
Dim nmFile As String

    rutaSitio2 = "C:\Sitios\VM2\"
    siFold = verificaCreaFolder(rutaSitio2)
    Set filetextStreamSql = crearTextStream(rutaSitio2 & "\" & "sqlActVM2.txt", True)
    esFecha = False
    contr = -2
    contS = -1
    contSh = -1
    Set dict = New Dictionary
    Set dictPSN = New Dictionary
    contOrden = 0
    contNombreRg = 0
    tipoArchivo = wbRepEj.CustomDocumentProperties(nmvlFileType)
    If Right(LCase(tipoArchivo), 1) = "x" Then
        tipoArchivo = Mid(tipoArchivo, 1, Len(tipoArchivo) - 1)
    End If
    If tipoArchivo <> "VM2Summary" Then
        MsgBox "No es un archivo Summary!!", vbCritical
        Exit Sub
    End If
    nombreRango = ""
    
    Set rgIdCust = wbRepEj.Sheets("Rep").Range("idCustomer")
    Set rgDef = wbRepEj.Sheets("RepPrev").Range("RangeDef")
    Set rgColVisPrev = wbRepEj.Sheets("RepPrev").Range("HideCol")
    Set rgHeaders2 = wbRepEj.Sheets("RepX").Range("TitleReport")
    Set rgLblAmi = wbRepEj.Sheets("LblNames").Range("AMI")
    Set rgDireccion = wbRepEj.Sheets("LblNames").Range("Direccion")
    Set rgSelector = wbRepEj.Sheets("Rep").Range("PPTseqRep")
    version = rgLblAmi.Value
    sptDireccion = Split(rgDireccion.Value, ":")(1)
    Set nm = wbRepEj.Names("nmLanguage")
    If InStr(nm.Value, "=") > 0 Then
        shLanguage = Replace(nm.Value, "=", "")
        shLanguage = Replace(shLanguage, """", "")
    Else
        shLanguage = nm.Value
    End If
        
     For Each sh In wbRepEj.Worksheets
        nombreHoja = sh.name
            contr = contr + 1
            'Or LCase(Left(nombreHoja, 8)) = "rep_prev")
            If (LCase(Left(nombreHoja, 3)) = "rep" Or LCase(Left(nombreHoja, 7)) = "repprev") _
                And Not LCase(Left(nombreHoja, 5)) = "rep01" _
                And Not LCase(Left(nombreHoja, 5)) = "rep02" _
                And Not LCase(Left(nombreHoja, 5)) = "rep03" _
                And Not LCase(Left(nombreHoja, 5)) = "rep04" _
                And Not LCase(Left(nombreHoja, 5)) = "rep05" Then
  
                Set rgRepLimit = sh.Range("ReportLimit")
                Set rgRangeDefAux = sh.Range("RangeDef")
                Set rgRangeDefRep = sh.Range(sh.Cells(rgRangeDefAux.Row, rgRangeDefAux.Column), sh.Cells(rgRangeDefAux.Row, rgRepLimit.Column - 1))
                Set rgHideRows = sh.Range("HideRow")
                Set rgHideColumns = sh.Range("HideCol")
                Set rgHeaders = sh.Range("Rep_Headers")
                Set rgHeaders1 = rgHeaders.Offset(-1)
                Set rgDatosAux = rgHeaders.Offset(1, 0)
                Set rgDatos = sh.Range(sh.Cells(rgDatosAux.Row, rgDatosAux.Column), sh.Cells(rgDatosAux.Row, rgRepLimit.Column - 1))
                Set rgDatosTotal = sh.Range(rgDatosAux, rgDatosAux.End(xlDown))
                Set rgComboKeyREP = buscarRangoHide(rgRangeDefRep, "ComboGasKey_sorted")
                Set rgComboKey = Application.Intersect(rgComboKeyREP.EntireColumn, rgDatosTotal)
                Set rgTitleReport = sh.Range("TitleReport")
                Set rgItemId = sh.Range("ItemID")
                
                For i = 1 To rgDatosTotal.rows.Count
                        ordRow = i
                        sep1 = ""
                        'asegurar que el  renglon es visible
                        Set rgRowVisible = Application.Intersect(rgDatosTotal, rgHideRows)
                        Set rgSelX = Application.Intersect(rgDatosTotal, rgSelector)
                      
                        If rgRowVisible(i, 1).Value = "" And LCase(rgSelX(i, 1).Value) = "x" Then
                            For j = 1 To rgDatosTotal.Columns.Count - 1
                                'asegurar que la columna es visible
                                Set rgColVisible = Application.Intersect(rgDatosTotal(i, j).EntireColumn, rgHideColumns.EntireRow)
                                Set rgFormato = Application.Intersect(rgDatosTotal(i, j).EntireColumn, rgRangeDefAux)
                                
                                
                                esVisible = False
                                esVisible = rgColVisible.Value = "" And rgFormato.Value <> ""
                                
                                If rgDatosTotal(i, j).Value <> "" Then

                                    If esVisible _
                                    And Not rgFormato.Value = "SortPos" _
                                    And Not rgFormato.Value = "DiagOut" _
                                    And Not rgFormato.Value = "daysLast" _
                                    And Not rgFormato.Value = "FileDate" _
                                    And Not rgFormato.Value = "Selector" _
                                    And Not rgFormato.Value = "prev_SortPos" Then
                                        
                                        contOrden = contOrden + 1
                                        valorTit = valorTit & sep1 & rgFormato.Value & "|" & contOrden & "|" & rgDatosTotal(i, j).Value
                                        sep1 = "#$1$"
                                        If rgFormato.Value = "Plant SN" Or rgFormato.Value = "prev_Plant SN" Then
                                            PSN = rgDatosTotal(i, j).Value
                                        End If
                                        If rgFormato.Value = "EAF" Or rgFormato.Value = "prev_EAF" Then
                                            EAF = rgDatosTotal(i, j).Value
                                        End If
                                        If LCase(Right(nombreHoja, 4)) = "prev" And Not LCase(Left(nombreHoja, 8)) = "rep_prev" Then
                                            If Not LCase(rgFormato.Value) = "item" Then
                                                If Not dict.Exists(rgFormato.Value) Then
                                                    s = s + 1
                                                    dict.Add rgFormato.Value, s
                                                End If
                                            End If
                                        End If
                                                                         
                                    End If
                                End If
                            Next j
                        End If
                        If PSN <> "" And EAF <> "" Then
                        strToBD = "'" & rgIdCust.Value & "','" & PSN & "','" & EAF & "'"
                            If LCase(Left(nombreHoja, 3)) = "rep" And Not LCase(Left(nombreHoja, 7)) = "repprev" _
                            And Not LCase(Left(nombreHoja, 8)) = "rep_prev" Then
                                filetextStreamSql.WriteLine "exec sp_actualizaBDSumm2" & strToBD & ",'" & ordRow & "','" & nombreHoja & _
                                "','" & valorTit & "'"
                                insertaDatosVM2toDB ("exec sp_actualizaBDSumm2" & strToBD & ",'" & ordRow & "','" & nombreHoja & _
                                "','" & valorTit & "'")
                                strToBD = ""
                                valorTit = ""
                                contOrden = 0
                            End If
                            If LCase(Right(nombreHoja, 4)) = "prev" And Not LCase(Left(nombreHoja, 8)) = "rep_prev" Then
                                filetextStreamSql.WriteLine "exec sp_actualizaBDSumm2" & strToBD & ",'" & ordRow & "','" & nombreHoja & _
                                "','" & valorTit & "'"
                                insertaDatosVM2toDB ("exec sp_actualizaBDSumm2" & strToBD & ",'" & ordRow & "','" & nombreHoja & _
                                "','" & valorTit & "'")
                                strToBD = ""
                                valorTit = ""
                                contOrden = 0
                            End If
                        End If

                        dictPSN.Add PSN, EAF
                        PSN = ""
                        EAF = ""
                Next i
           End If
           If LCase(Left(nombreHoja, 8)) = "rep_prev" Then
           
                 lastRow = sh.Range("A" & rows.Count).End(xlUp).Row
                 lastCol = sh.Cells(1, Columns.Count).End(xlToLeft).Column
                 contOrden = 0
                 ordRow = 0
                 strToBD = ""
                 valorTit = ""
                 PSN = ""
                 EAF = ""
                 kk = 0
                 Set rgRep_Prev = sh.Range(sh.Cells(2, 1), sh.Cells(lastRow, lastCol))
                 Set rgHdrPrev = sh.Range(sh.Cells(1, 1), sh.Cells(1, lastCol))
                
                 For y = 1 To rgRep_Prev.rows.Count
                  ordRow = y
                  k = 0
                  sep1 = ""
                    For z = 1 To rgRep_Prev.Columns.Count - 1
                        If z = 1 Then
                            contOrden = contOrden + 1
                            valorTit = valorTit & sep1 & "Fecha" & "|" & contOrden & "|" & rgRep_Prev(y, z).Value
                            sep1 = "#$1$"
                        Else
                            contOrden = contOrden + 1
                            valorTit = valorTit & sep1 & dict.Keys(k) & "|" & contOrden & "|" & rgRep_Prev(y, z).Value
                            If dict.Keys(k) = "prev_Plant SN" Then
                                PSN = rgRep_Prev(y, z).Value
                            End If
                            If dict.Keys(k) = "prev_EAF" Then
                                EAF = rgRep_Prev(y, z).Value
                            End If
                            k = k + 1
                        End If
                    Next z
                    For kk = 1 To dictPSN.Count - 1
                        If dictPSN.Keys(kk) = PSN And dictPSN.Items(kk) = EAF Then
                            strToBD = "'" & rgIdCust.Value & "','" & PSN & "','" & EAF & "'"
                            filetextStreamSql.WriteLine "exec sp_actualizaBDSumm2" & strToBD & ",'" & ordRow & "','" & nombreHoja & _
                            "','" & valorTit & "'"
                            insertaDatosVM2toDB ("exec sp_actualizaBDSumm2" & strToBD & ",'" & ordRow & "','" & nombreHoja & _
                            "','" & valorTit & "'")
                            strToBD = ""
                            valorTit = ""
                            contOrden = 0
                            Exit For
                        End If
                    Next kk
                 Next y
                 

           End If
        
    Next
    
    nmFile = rgIdCust.Value
    driveLoc = wbRepEj.path
    driveAce = obtieneDriveAcerias()
    If driveAce = "" Then
        MsgBox "No se tiene acceso al drive con [\\10.0.4.4\Acerias]"
        Exit Sub
    End If
    
    rutaServidor = driveAce & sptDireccion
    rutaLocal = driveLoc

    Set fldServ = fso.GetFolder(rutaServidor)
    Set fldLocal = fso.GetFolder(rutaLocal)
    nFilServ = -1
    For Each filServ In fldServ.Files
        If Left(LCase(filServ.name), 8) <> "semaforo" Then
            nFilServ = nFilServ + 1
            ReDim Preserve arrFilServ(nFilServ)
            Set arrFilServ(nFilServ) = filServ
        End If
    Next
    nFilLocal = -1
    For Each filLocal In fldLocal.Files
        If Left(LCase(filLocal.name), 8) <> "semaforo" Then
            nFilLocal = nFilLocal + 1
            ReDim Preserve arrFilLocal(nFilLocal)
            Set arrFilLocal(nFilLocal) = filLocal
        End If
    Next
 'copiar los modificados
    For i = 0 To nFilLocal
        If (arrFilLocal(i).name Like nmFile & "*") Then
            pos = -1
            For j = 0 To nFilServ
                If arrFilLocal(i).name = arrFilServ(j).name Then
                    If arrFilLocal(i).DateLastModified > arrFilServ(j).DateLastModified Then
                        'fso.DeleteFile arrFilServ(j).path
                        fso.CopyFile arrFilLocal(i).path, arrFilServ(j).path, True
                    End If
                    pos = j
                    Exit For
                End If
            Next j
            If pos < 0 Then
                nombreServidor = rutaServidor & arrFilLocal(i).name
                fso.CopyFile arrFilLocal(i).path, nombreServidor, True
            End If
        End If
    Next i
    wbRepEj.Close Savechanges:=False

End Sub