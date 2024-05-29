create table #temporal (idRango int,nombre varchar(100),hoja varchar(50))
declare @idFecha int
declare @idRango int
declare @idTituloSup int
set @idFecha=1
exec sp_actualizaSummary_GOL '89#$1$KyoeiSG#$1$EAF#$1$1#$1$#$1$1#$1$AMIoil17GasOnLineAltaSteel EAF Tamini_67599 MT#$1$KyoeiSG_Alta_EAF_67599_MT#$1$ #$1$1#$1$ #$1$ #$1$ #$1$KyoeiSG_Alta_EAF_67599_MT#$1$EAF Tamini 67599_MT'
exec sp_actualizaSummary_GOL '190#$1$KyoeiSG#$1$LMF#$1$2#$1$#$1$1#$1$AMIoil17GasOnLineAltaSteel LMF Tamini_67585 MT#$1$KyoeiSG_Alta_LMF_67585_MT#$1$ #$1$1#$1$ #$1$ #$1$ #$1$KyoeiSG_Alta_LMF_67585_MT#$1$LMF Tamini 67585_MT'
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep00',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep00')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep00',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep00',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep00',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep00',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep00',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep00',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep00',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep00',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary Date_StartEvaluation_sorted','Rep00',76,9,'center',0,'GOLSummary','Evaluation<br/>Start Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_StartEvaluation_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary Days_Evaluation_sorted','Rep00',58,10,'center',0,'GOLSummary','Evaluation<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_Evaluation_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary Date_InitialSample_sorted','Rep00',76,11,'center',0,'GOLSummary','Initial Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_InitialSample_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary MinHour_PrevSample_sorted','Rep00',52,12,'center',0,'GOLSummary','Min Hour <br/> Previous Sample','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary MinHour_PrevSample_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary MaxHour_PrevSample_sorted','Rep00',52,13,'center',0,'GOLSummary','Max Hour <br/> Previous Sample','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary MaxHour_PrevSample_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary FastestKeyGas_sorted','Rep00',117,14,'center',0,'GOLSummary','Key Gas','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestKeyGas_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary EventDescription_sorted','Rep00',386,15,'left',0,'GOLSummary','Event at start date of evaluation','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary EventDescription_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep00',40,16,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep00',44,17,'center',0,'GOLSummary','Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep00')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep00',44,17,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep00',44,18,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary Value_LastSample_sorted_r1','Rep00',33,19,'center',0,'GOLSummary','Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Value_LastSample_sorted_r1','Rep00')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary Value_LastSample_sorted','Rep00',33,19,'center',0,'GOLSummary','Time','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Value_LastSample_sorted','Rep00')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep01',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep01')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep01',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep01',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep01',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep01',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep01',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep01',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep01',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep01',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary FastestTimeToSevere_sorted_r1','Rep01',76,9,'center',0,'GOLSummary','Fastest to Severe','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestTimeToSevere_sorted_r1','Rep01')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary FastestTimeToSevere_sorted','Rep01',76,9,'center',0,'GOLSummary','Time to Severe<br/>months','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestTimeToSevere_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary FastestKeyGas_sorted','Rep01',112,10,'center',0,'GOLSummary','Key Gas','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestKeyGas_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary FastestGasPPM_sorted','Rep01',76,11,'center',0,'GOLSummary','Gas Content<br/>ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestGasPPM_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary FastestSeverePer_sorted','Rep01',76,12,'center',0,'GOLSummary','Severe Limit<br/>%','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestSeverePer_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary FastestCombustiblePer_sorted','Rep01',76,13,'center',0,'GOLSummary','Combustible<br/>%','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestCombustiblePer_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01ON_sorted','Rep01',45,14,'center',0,'GOLSummary','Missing<br/>Effect Positive','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01ON_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01Days_sorted','Rep01',52,15,'center',0,'GOLSummary','Missing<br/>Effect |days| >1','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01Days_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary ChangeWorstPos_sorted','Rep01',45,16,'center',0,'GOLSummary','Missing<br/>Effect |days| >1','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ChangeWorstPos_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted_r1','Rep01',52,17,'center',0,'GOLSummary',' Change Time - months','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted_r1','Rep01')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted','Rep01',52,17,'center',0,'GOLSummary','Fast to-Severe','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted','Rep01',52,18,'center',0,'GOLSummary','Highest-Rate','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep01',45,19,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep01',44,20,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep01')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep01',44,20,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep01',44,21,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep01')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep02',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep02')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep02',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep02',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep02',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep02',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep02',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep02',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep02',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep02',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary HighestGasRate_sorted_r1','Rep02',76,9,'center',0,'GOLSummary','Highest Rate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestGasRate_sorted_r1','Rep02')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary HighestGasRate_sorted','Rep02',76,9,'center',0,'GOLSummary','Gas Rate<br/>ppm/30days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestGasRate_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary HighestKeyGas_sorted','Rep02',112,10,'center',0,'GOLSummary','Key Gas','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestKeyGas_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary HighestGasPPM_sorted','Rep02',76,11,'center',0,'GOLSummary','Gas Content<br/>ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestGasPPM_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary HighestSeverePer_sorted','Rep02',76,12,'center',0,'GOLSummary','Severe Limit<br/>%','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestSeverePer_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary HighestCombustiblePer_sorted','Rep02',76,13,'center',0,'GOLSummary','Combustible<br/>%','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestCombustiblePer_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted_r1','Rep02',52,14,'center',0,'GOLSummary',' Change Time - months','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted_r1','Rep02')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted','Rep02',52,14,'center',0,'GOLSummary','Fast to<br/>Severe','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted','Rep02',52,15,'center',0,'GOLSummary','Highest<br/>Rate','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep02',52,16,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep02',44,17,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep02')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep02',44,17,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep02',44,18,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep02')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep03',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep03')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep03',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep03',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep03',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep03',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep03',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep03',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep03',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep03',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary TotalComb_sorted','Rep03',76,9,'center',0,'GOLSummary','Combustible<br/>ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TotalComb_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary TotalCO2_sorted','Rep03',64,10,'center',0,'GOLSummary','CO2<br/>ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TotalCO2_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary RelCO2CO_sorted','Rep03',64,11,'center',0,'GOLSummary','CO2/CO<br/>ratio','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RelCO2CO_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary RelO2N2_sorted','Rep03',64,12,'center',0,'GOLSummary','O2/N2<br/>ratio','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RelO2N2_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary CombTimeToSevere_sorted_r1','Rep03',68,13,'center',0,'GOLSummary','Time to Severe, months','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary CombTimeToSevere_sorted_r1','Rep03')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary CombTimeToSevere_sorted','Rep03',68,13,'center',0,'GOLSummary','Time Combustible<br/>ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary CombTimeToSevere_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary CO2TimeToSevere_sorted','Rep03',64,14,'center',0,'GOLSummary','Time CO2<br/>ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary CO2TimeToSevere_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary CO2COTimeToSevere_sorted','Rep03',64,15,'center',0,'GOLSummary','Time CO2/CO<br/>ratio','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary CO2COTimeToSevere_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary O2N2TimeToSevere_sorted','Rep03',64,16,'center',0,'GOLSummary','Time O2/N2<br/>ratio','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary O2N2TimeToSevere_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep03',44,17,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep03')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep03',44,17,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep03',44,18,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep03')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep04',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep04')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep04',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep04',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep04',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep04',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep04',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep04',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep04',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep04',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary AMI_WeighedGasDecay_sorted_r1','Rep04',58,9,'center',0,'GOLSummary','Weighed Gas Decay','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AMI_WeighedGasDecay_sorted_r1','Rep04')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary AMI_WeighedGasDecay_sorted','Rep04',58,9,'center',0,'GOLSummary','AMI','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AMI_WeighedGasDecay_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary ANSI_WeighedGasDecay_sorted','Rep04',58,10,'center',0,'GOLSummary','ANSI','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ANSI_WeighedGasDecay_sorted','Rep04')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary AMI_Code_sorted','Rep04',40,11,'center',0,'GOLSummary','AMI<br/>Code','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AMI_Code_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary ANSI_Code_sorted','Rep04',40,12,'center',0,'GOLSummary','ANSI<br/>Code','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ANSI_Code_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary Monitor_EqHydran_sorted_r1','Rep04',64,13,'center',0,'GOLSummary',' Equivalent Hydran','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Monitor_EqHydran_sorted_r1','Rep04')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary Monitor_EqHydran_sorted','Rep04',64,13,'center',0,'GOLSummary','Monitor','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Monitor_EqHydran_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary PossibleHydran_EqHydran_sorted','Rep04',64,14,'center',0,'GOLSummary','Possible<br/>Monitor','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PossibleHydran_EqHydran_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep04',44,15,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep04')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep04',44,15,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep04',44,16,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep04')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep05',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep05')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep05',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep05',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep05',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep05',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep05',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep05',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep05',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep05',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary RankByTimeToSevere_IDGas1_sorted_r1','Rep05',112,9,'center',0,'GOLSummary','Ranking by Time to Severe Limit','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByTimeToSevere_IDGas1_sorted_r1','Rep05')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary RankByTimeToSevere_IDGas1_sorted','Rep05',112,9,'center',0,'GOLSummary','ID Gas1<br/>by TimeToLimit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByTimeToSevere_IDGas1_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary RankByTimeToSevere_MonthsGas1_sorted','Rep05',76,10,'center',0,'GOLSummary','Gas1<br/>Months','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByTimeToSevere_MonthsGas1_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary RankByTimeToSevere_IDGas2_sorted','Rep05',112,11,'center',0,'GOLSummary','ID Gas2<br/>by TimeToLimit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByTimeToSevere_IDGas2_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary RankByTimeToSevere_MonthsGas2_sorted','Rep05',76,12,'center',0,'GOLSummary','Gas2<br/>Months','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByTimeToSevere_MonthsGas2_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary RankByTimeToSevere_IDGas3_sorted','Rep05',112,13,'center',0,'GOLSummary','ID Gas3<br/>by TimeToLimit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByTimeToSevere_IDGas3_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary RankByTimeToSevere_MonthsGas3_sorted','Rep05',76,14,'center',0,'GOLSummary','Gas3<br/>Months','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByTimeToSevere_MonthsGas3_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep05',44,15,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep05')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep05',44,15,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep05',44,16,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep05')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep06',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep06')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep06',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep06',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep06',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep06',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep06',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep06',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep06',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep06',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary RankByParticipation_IDGas1_sorted_r1','Rep06',112,9,'center',0,'GOLSummary','Ranking by Participation','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByParticipation_IDGas1_sorted_r1','Rep06')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary RankByParticipation_IDGas1_sorted','Rep06',112,9,'center',0,'GOLSummary','ID Gas1<br/>by Combustible','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByParticipation_IDGas1_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary RankByParticipation_percCombGas1_sorted','Rep06',76,10,'center',0,'GOLSummary','Gas1<br/>% Combustibe','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByParticipation_percCombGas1_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary RankByParticipation_IDGas2_sorted','Rep06',112,11,'center',0,'GOLSummary','ID Gas2<br/>by Combustible','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByParticipation_IDGas2_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary RankByParticipation_percCombGas2_sorted','Rep06',76,12,'center',0,'GOLSummary','Gas2<br/>% Combustibe','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByParticipation_percCombGas2_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary RankByParticipation_IDGas3_sorted','Rep06',112,13,'center',0,'GOLSummary','ID Gas3<br/>by Combustible','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByParticipation_IDGas3_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary RankByParticipation_percCombGas3_sorted','Rep06',76,14,'center',0,'GOLSummary','Gas3<br/>% Combustibe','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByParticipation_percCombGas3_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep06',44,15,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep06')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep06',44,15,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep06',44,16,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep06')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep07',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep07')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep07',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep07',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep07',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep07',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep07',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep07',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep07',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep07',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary RankBySevereLimit_IDGas1_sorted_r1','Rep07',112,9,'center',0,'GOLSummary','Ranking by Severe Limit','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankBySevereLimit_IDGas1_sorted_r1','Rep07')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary RankBySevereLimit_IDGas1_sorted','Rep07',112,9,'center',0,'GOLSummary','ID Gas1<br/>by Limit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankBySevereLimit_IDGas1_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary RankBySevereLimit_percLimitGas1_sorted','Rep07',76,10,'center',0,'GOLSummary','Gas1<br/>% Limit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankBySevereLimit_percLimitGas1_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary RankBySevereLimit_IDGas2_sorted','Rep07',112,11,'center',0,'GOLSummary','ID Gas2<br/>by Limit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankBySevereLimit_IDGas2_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary RankBySevereLimit_percLimitGas2_sorted','Rep07',76,12,'center',0,'GOLSummary','Gas2<br/>% Limit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankBySevereLimit_percLimitGas2_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary RankBySevereLimit_IDGas3_sorted','Rep07',112,13,'center',0,'GOLSummary','ID Gas3<br/>by Limit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankBySevereLimit_IDGas3_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary RankBySevereLimit_percLimitGas3_sorted','Rep07',76,14,'center',0,'GOLSummary','Gas3<br/>% Limit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankBySevereLimit_percLimitGas3_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep07',44,15,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep07')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep07',44,15,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep07',44,16,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep07')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep08',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep08')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep08',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep08',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep08',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep08',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep08',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep08',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep08',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep08',76,8,'center',0,'GOLSummary','Last Sample-Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary RankByRateofGeneration_IDGas1_sorted_r1','Rep08',112,9,'center',0,'GOLSummary','Ranking by Rate of Generation','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByRateofGeneration_IDGas1_sorted_r1','Rep08')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary RankByRateofGeneration_IDGas1_sorted','Rep08',112,9,'center',0,'GOLSummary','ID Gas1<br/>by Rate','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByRateofGeneration_IDGas1_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary RankByRateofGeneration_ppm30daysGas1_sorted','Rep08',76,10,'center',0,'GOLSummary','Gas1<br/>ppm/30days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByRateofGeneration_ppm30daysGas1_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary RankByRateofGeneration_IDGas2_sorted','Rep08',112,11,'center',0,'GOLSummary','ID Gas2<br/>by Rate','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByRateofGeneration_IDGas2_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary RankByRateofGeneration_ppm30daysGas2_sorted','Rep08',76,12,'center',0,'GOLSummary','Gas2<br/>ppm/30days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByRateofGeneration_ppm30daysGas2_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary RankByRateofGeneration_IDGas3_sorted','Rep08',112,13,'center',0,'GOLSummary','ID Gas3<br/>by Rate','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByRateofGeneration_IDGas3_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary RankByRateofGeneration_ppm30daysGas3_sorted','Rep08',76,14,'center',0,'GOLSummary','Gas3<br/>ppm/30days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary RankByRateofGeneration_ppm30daysGas3_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep08',44,15,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep08')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep08',44,15,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep08',44,16,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep08')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep09',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep09')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep09',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep09',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep09',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep09',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep09',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep09',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep09',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep09',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary FastestTimeToSevere_sorted_r1','Rep09',76,9,'center',0,'GOLSummary','Fastest to Severe','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestTimeToSevere_sorted_r1','Rep09')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary FastestTimeToSevere_sorted','Rep09',76,9,'center',0,'GOLSummary','Time to Severe<br/>months','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestTimeToSevere_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary FastestKeyGas_sorted','Rep09',112,10,'left',0,'GOLSummary','Key Gas','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastestKeyGas_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted_r1','Rep09',76,11,'center',0,'GOLSummary',' Change Time - months','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted_r1','Rep09')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted','Rep09',76,11,'center',0,'GOLSummary','Fast to<br/>Severe','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary FastmonthsToSevere_DifPrev_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted','Rep09',76,12,'center',0,'GOLSummary','Highest<br/>Rate','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary Monitor_DifPrev_sorted_r1','Rep09',64,13,'center',0,'GOLSummary',' Change Magnitude','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Monitor_DifPrev_sorted_r1','Rep09')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary Monitor_DifPrev_sorted','Rep09',64,13,'center',0,'GOLSummary','Monitor','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Monitor_DifPrev_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary EqHydran_DifPrev_sorted','Rep09',64,14,'center',0,'GOLSummary','Eq, Hydran','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary EqHydran_DifPrev_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary AmbTemp_IncreaseSlope_sorted_r1','Rep09',64,15,'center',0,'GOLSummary',' Effect of Ambient Temperature','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AmbTemp_IncreaseSlope_sorted_r1','Rep09')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary AmbTemp_IncreaseSlope_sorted','Rep09',64,15,'center',0,'GOLSummary','Increment<br/>Slope','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AmbTemp_IncreaseSlope_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary AmbTemp_ReduceSlope_sorted','Rep09',64,16,'center',0,'GOLSummary','Reduce<br/>Slope','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AmbTemp_ReduceSlope_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary AmbTemp_IncreaseR2_sorted','Rep09',64,17,'center',0,'GOLSummary','Increment<br/>R2','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AmbTemp_IncreaseR2_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary AmbTemp_ReduceR2_sorted','Rep09',64,18,'center',0,'GOLSummary','Reduce<br/>R2','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AmbTemp_ReduceR2_sorted','Rep09')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep09',34,19,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep09',44,20,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep09')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep09',44,20,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep09',44,21,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep09')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep10',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep10')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep10',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep10',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep10',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep10',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep10',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep10',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep10',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep10',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_Date_LastAux_sorted','Rep10',72,9,'left',0,'GOLSummary','Last Aux<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_Date_LastAux_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_DifDate','Rep10',44,10,'left',0,'GOLSummary','Days Sample<br/>to Aux','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_DifDate','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_ShortID_sorted','Rep10',124,11,'center',0,'GOLSummary','Process<br/>Identification','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_ShortID_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_Description_sorted','Rep10',196,12,'left',0,'GOLSummary','Process Description','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_Description_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_IncreaseSlope_sorted_r1','Rep10',64,13,'center',0,'GOLSummary','Effect of Process','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_IncreaseSlope_sorted_r1','Rep10')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_IncreaseSlope_sorted','Rep10',64,13,'center',0,'GOLSummary','Increment<br/>Slope','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_IncreaseSlope_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_ReduceSlope_sorted','Rep10',64,14,'center',0,'GOLSummary','Reduce<br/>Slope','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_ReduceSlope_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_IncreaseR2_sorted','Rep10',64,15,'center',0,'GOLSummary','Increment<br/>R2','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_IncreaseR2_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_ReduceR2_sorted','Rep10',64,16,'center',0,'GOLSummary','Reduce<br/>R2','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_ReduceR2_sorted','Rep10')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep10',34,17,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep10',44,18,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep10')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep10',44,18,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep10',44,19,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep10')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep11',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep11')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep11',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep11',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep11',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep11',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep11',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep11',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep11',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep11',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_ShortID_sorted','Rep11',93,9,'center',0,'GOLSummary','Process<br/>Identification','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_ShortID_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AuxVal01_ID_sorted','Rep11',88,10,'left',0,'GOLSummary','Key GasA<br/>AuxVal01','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AuxVal01_ID_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AuxVal01_ExistingVal_sorted_r1','Rep11',76,11,'center',0,'GOLSummary','Linear Correlation - Slope','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AuxVal01_ExistingVal_sorted_r1','Rep11')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AuxVal01_ExistingVal_sorted','Rep11',76,11,'center',0,'GOLSummary','Key GasA<br/>AuxVal01 Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AuxVal01_ExistingVal_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AuxVal01_ChangePerc_sorted','Rep11',76,12,'center',0,'GOLSummary','Key GasA<br/>AuxVal01 %Change','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AuxVal01_ChangePerc_sorted','Rep11')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AuxVal01_ID_sorted','Rep11',88,13,'left',0,'GOLSummary','Key GasB<br/>AuxVal01','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AuxVal01_ID_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AuxVal01_ExistingVal_sorted_r1','Rep11',76,14,'center',0,'GOLSummary',' Linear Correlation - Slope','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AuxVal01_ExistingVal_sorted_r1','Rep11')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AuxVal01_ExistingVal_sorted','Rep11',76,14,'center',0,'GOLSummary','Key GasB<br/>AuxVal01 Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AuxVal01_ExistingVal_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AuxVal01_ChangePerc_sorted','Rep11',76,15,'center',0,'GOLSummary','Key GasB<br/>AuxVal01 %Change','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AuxVal01_ChangePerc_sorted','Rep11')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AuxVal01_ID_sorted','Rep11',88,16,'left',0,'GOLSummary','Key GasC<br/>AuxVal01 Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AuxVal01_ID_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AuxVal01_ExistingVal_sorted_r1','Rep11',76,17,'center',0,'GOLSummary',' Linear Correlation - Slope','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AuxVal01_ExistingVal_sorted_r1','Rep11')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AuxVal01_ExistingVal_sorted','Rep11',76,17,'center',0,'GOLSummary','Key GasC<br/>AuxVal01 Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AuxVal01_ExistingVal_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AuxVal01_ChangePerc_sorted','Rep11',69,18,'center',0,'GOLSummary','Key GasC<br/>AuxVal01 %Change','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AuxVal01_ChangePerc_sorted','Rep11')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep11',34,19,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep11',44,20,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep11')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep11',44,20,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep11',44,21,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep11')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep12',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep12')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep12',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep12',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep12',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep12',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep12',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep12',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep12',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep12',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary AuxVal01_ShortID_sorted','Rep12',93,9,'center',0,'GOLSummary','Process<br/>Identification','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AuxVal01_ShortID_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AmbTemp_ID_sorted','Rep12',88,10,'left',0,'GOLSummary','Key GasA<br/>Amb Temp','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AmbTemp_ID_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AmbTemp_ExistingVal_sorted_r1','Rep12',76,11,'center',0,'GOLSummary','Linear Correlation - Slope','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AmbTemp_ExistingVal_sorted_r1','Rep12')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AmbTemp_ExistingVal_sorted','Rep12',76,11,'center',0,'GOLSummary','Key GasA<br/>Amb Temp Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AmbTemp_ExistingVal_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasA_AmbTemp_ChangePerc_sorted','Rep12',76,12,'center',0,'GOLSummary','Key GasA<br/>Amb Temp %Change','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasA_AmbTemp_ChangePerc_sorted','Rep12')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AmbTemp_ID_sorted','Rep12',88,13,'left',0,'GOLSummary','Key GasB<br/>Amb Temp','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AmbTemp_ID_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AmbTemp_ExistingVal_sorted_r1','Rep12',76,14,'center',0,'GOLSummary',' Linear Correlation - Slope','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AmbTemp_ExistingVal_sorted_r1','Rep12')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AmbTemp_ExistingVal_sorted','Rep12',76,14,'center',0,'GOLSummary','Key GasB<br/>Amb Temp Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AmbTemp_ExistingVal_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasB_AmbTemp_ChangePerc_sorted','Rep12',76,15,'center',0,'GOLSummary','Key GasB<br/>Amb Temp %Change','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasB_AmbTemp_ChangePerc_sorted','Rep12')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AmbTemp_ID_sorted','Rep12',88,16,'left',0,'GOLSummary','Key GasC<br/>Amb Temp Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AmbTemp_ID_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AmbTemp_ExistingVal_sorted_r1','Rep12',76,17,'center',0,'GOLSummary',' Linear Correlation - Slope','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AmbTemp_ExistingVal_sorted_r1','Rep12')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AmbTemp_ExistingVal_sorted','Rep12',76,17,'center',0,'GOLSummary','Key GasC<br/>Amb Temp Value','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AmbTemp_ExistingVal_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary KeyGasC_AmbTemp_ChangePerc_sorted','Rep12',69,18,'center',0,'GOLSummary','Key GasC<br/>Amb Temp %Change','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary KeyGasC_AmbTemp_ChangePerc_sorted','Rep12')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep12',34,19,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep12',44,20,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep12')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep12',44,20,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep12',44,21,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep12')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep13',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep13')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep13',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep13',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep13',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep13',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep13',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep13',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep13',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep13',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary Ratio1_CH4_H2_sorted_r1','Rep13',52,9,'center',0,'GOLSummary','Gas Ratios & Percent Difference from Previous','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Ratio1_CH4_H2_sorted_r1','Rep13')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary Ratio1_CH4_H2_sorted','Rep13',52,9,'center',0,'GOLSummary','R1<br/>CH4 / H2','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Ratio1_CH4_H2_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Ratio1_CH4_H2_sorted','Rep13',50,10,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Ratio1_CH4_H2_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary Ratio2_C2H2_C2H4_sorted','Rep13',52,11,'center',0,'GOLSummary','R2 Arc+Therm<br/>C2H2 / C2H4','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Ratio2_C2H2_C2H4_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Ratio2_C2H2_C2H4_sorted','Rep13',45,12,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Ratio2_C2H2_C2H4_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary Ratio3_C2H2_CH4_sorted','Rep13',52,13,'center',0,'GOLSummary','R3<br/>C2H2 / CH4','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Ratio3_C2H2_CH4_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Ratio3_C2H2_CH4_sorted','Rep13',45,14,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Ratio3_C2H2_CH4_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary Ratio4_C2H6_C2H2_sorted','Rep13',52,15,'center',0,'GOLSummary','R4 Thermal<br/>C2H6 / C2H2','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Ratio4_C2H6_C2H2_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Ratio4_C2H6_C2H2_sorted','Rep13',45,16,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Ratio4_C2H6_C2H2_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary Ratio5_C2H4_C2H6_sorted','Rep13',52,17,'center',0,'GOLSummary','R5 Arc<br/>C2H4 / C2H6','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Ratio5_C2H4_C2H6_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Ratio5_C2H4_C2H6_sorted','Rep13',45,18,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Ratio5_C2H4_C2H6_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary Ratio_ThermalR4_R2_sorted','Rep13',52,19,'center',0,'GOLSummary','Thermal Ratio<br/>R4 / R2','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Ratio_ThermalR4_R2_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Ratio_ThermalR4_R2_sorted','Rep13',45,20,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Ratio_ThermalR4_R2_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary MonthsToSeverR2R5_Discharge_sorted','Rep13',52,21,'center',0,'GOLSummary','months <br/>R2 & R5 Disch.','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary MonthsToSeverR2R5_Discharge_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_MonthsToSeverR2R5_Discharge_sorted','Rep13',45,22,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_MonthsToSeverR2R5_Discharge_sorted','Rep13')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep13',34,23,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep13',44,24,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep13')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep13',44,24,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep13',44,25,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep13')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep14',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep14')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep14',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep14',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep14',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep14',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep14',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep14',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep14',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep14',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary Oil_BottomTemperature_sorted_r1','Rep14',52,9,'center',0,'GOLSummary','System data & Percent Difference from Previous','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Oil_BottomTemperature_sorted_r1','Rep14')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary Oil_BottomTemperature_sorted','Rep14',52,9,'center',0,'GOLSummary','avg<br/>Bottom Oil Temp_oC','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Oil_BottomTemperature_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Oil_BottomTemperature_sorted','Rep14',45,10,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Oil_BottomTemperature_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary AmbientTemperature_sorted','Rep14',52,11,'center',0,'GOLSummary','avg<br/>Ambient Temp_oC','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary AmbientTemperature_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_AmbientTemperature_sorted','Rep14',45,12,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_AmbientTemperature_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary Oil_MoistureContent_sorted','Rep14',52,13,'center',0,'GOLSummary','avg<br/>Moisture_ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Oil_MoistureContent_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Oil_MoistureContent_sorted','Rep14',45,14,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Oil_MoistureContent_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary O2_ppm_sorted','Rep14',52,15,'center',0,'GOLSummary','avg<br/>O2_ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary O2_ppm_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_O2_ppm_sorted','Rep14',45,16,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_O2_ppm_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary N2_ppm_sorted','Rep14',52,17,'center',0,'GOLSummary','avg<br/>N2_ppm','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary N2_ppm_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_N2_ppm_sorted','Rep14',45,18,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_N2_ppm_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary Oil_Pressure_sorted','Rep14',52,19,'center',0,'GOLSummary','avg<br/>Oil Pressure','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Oil_Pressure_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_Oil_Pressure_sorted','Rep14',45,20,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_Oil_Pressure_sorted','Rep14')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep14',34,21,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep14',44,22,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep14')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep14',44,22,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep14',44,23,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep14')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep15',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep15')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep15',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep15',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep15',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep15',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep15',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep15',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep15',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep15',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_C2H2_Acetylene_r1','Rep15',52,9,'center',0,'GOLSummary','Gas Content Last N samples (ppm) & Percent Difference from Previous','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_C2H2_Acetylene_r1','Rep15')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary LastN_C2H2_Acetylene','Rep15',52,9,'center',0,'GOLSummary','LastN<br/>C2H2<br/>Acetylene','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_C2H2_Acetylene','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_C2H2_Acetylene','Rep15',45,10,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_C2H2_Acetylene','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_H2_Hydrogen','Rep15',52,11,'center',0,'GOLSummary','LastN<br/>H2<br/>Hydrogen','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_H2_Hydrogen','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_H2_Hydrogen','Rep15',45,12,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_H2_Hydrogen','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_C2H4_Ethylene','Rep15',52,13,'center',0,'GOLSummary','LastN<br/>C2H4<br/>Ethylene','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_C2H4_Ethylene','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_C2H4_Ethylene','Rep15',45,14,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_C2H4_Ethylene','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_C2H6_Ethane','Rep15',52,15,'center',0,'GOLSummary','LastN<br/>C2H6<br/>Ethane','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_C2H6_Ethane','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_C2H6_Ethane','Rep15',45,16,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_C2H6_Ethane','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_CH4_Methane','Rep15',52,17,'center',0,'GOLSummary','LastN<br/>CH4<br/>Methane','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_CH4_Methane','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_CH4_Methane','Rep15',45,18,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_CH4_Methane','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_CO','Rep15',52,19,'center',0,'GOLSummary','LastN<br/>CO','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_CO','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_CO','Rep15',45,20,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_CO','Rep15')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep15',34,21,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep15',44,22,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep15')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep15',44,22,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep15',44,23,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep15')
exec sp_ActualizaRango3 'GasOnLineSummary idCustomer','Rep16',160,0,'left',0,'GOLSummary','Corporate','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary idCustomer','Rep16')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Item','Rep16',40,1,'center',0,'GOLSummary','Item','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Item','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary ComboGasKey_sorted','Rep16',0,2,'left',0,'GOLSummary','ComboKey after Sort','','English',False,@idFecha,0, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary ComboGasKey_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary PlantLocation_sorted','Rep16',100,3,'left',0,'GOLSummary','Plant Location','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary PlantLocation_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary TxUnit_Man_SN_sorted','Rep16',184,4,'left',0,'GOLSummary','Tx Unit','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TxUnit_Man_SN_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary LocalName_sorted','Rep16',45,5,'left',0,'GOLSummary','Local Name','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LocalName_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary SystemType_sorted','Rep16',45,6,'left',0,'GOLSummary','Type of System','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary SystemType_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary TypeOfTankShort_sorted','Rep16',45,7,'left',0,'GOLSummary','Type of Tank','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary TypeOfTankShort_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary Date_LastSample_sorted','Rep16',76,8,'center',0,'GOLSummary','Last Sample<br/>Date','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Date_LastSample_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_Combustible_r1','Rep16',52,9,'center',0,'GOLSummary','Total Gas Decay & Percent  Difference from Previous','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_Combustible_r1','Rep16')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary LastN_Combustible','Rep16',52,9,'center',0,'GOLSummary','LastN<br/>Combustible Gas','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_Combustible','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_Combustible','Rep16',45,10,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_Combustible','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_Decay_ANSI','Rep16',52,11,'center',0,'GOLSummary','LastN<br/>Decay<br/>ANSI','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_Decay_ANSI','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_Decay_ANSI','Rep16',45,12,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_Decay_ANSI','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary LastN_Decay_AMI','Rep16',52,13,'center',0,'GOLSummary','LastN<br/>Decay<br/>AMI','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary LastN_Decay_AMI','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary difPre_LastN_Decay_AMI','Rep16',45,14,'center',0,'GOLSummary','','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary difPre_LastN_Decay_AMI','Rep16')
set @idTituloSup = 0
exec sp_ActualizaRango3 'GasOnLineSummary Days_PrevRevision_sorted','Rep16',34,15,'center',0,'GOLSummary','Prev<br/>days','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary Days_PrevRevision_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted_r1','Rep16',44,16,'center',0,'GOLSummary',' Sample Time','','English',False,@idFecha,1, 0,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted_r1','Rep16')
set @idTituloSup = @idRango
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_sorted','Rep16',44,16,'center',0,'GOLSummary','Hrs','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_sorted','Rep16')
exec sp_ActualizaRango3 'GasOnLineSummary sampleHrs_New_sorted','Rep16',44,17,'center',0,'GOLSummary','Hrs<br/>New','','English',False,@idFecha,1, @idTituloSup,0,1, @idRangoOut = @idRango OUTPUT
insert into #temporal (idRango,nombre,hoja) values (@idRango,'GasOnLineSummary sampleHrs_New_sorted','Rep16')
select * from #temporal
print 'Rep01'
exec sp_actualizaValorGOL 'Rep00,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_StartEvaluation_sorted#$1$08 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_Evaluation_sorted#$1$20.249#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_InitialSample_sorted#$1$15 Jun 2022#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary MinHour_PrevSample_sorted#$1$0.249560185184237#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary MaxHour_PrevSample_sorted#$1$0.749155092591536#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary EventDescription_sorted#$1$EAF: Faster Log samples from 1 to 6 hours per sample#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Value_LastSample_sorted#$1$0#$1$#C0C0C0#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep00,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_StartEvaluation_sorted#$1$19 Apr 2024#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Days_Evaluation_sorted#$1$38.323#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_InitialSample_sorted#$1$15 Jun 2022#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary MinHour_PrevSample_sorted#$1$0.416539351848769#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary MaxHour_PrevSample_sorted#$1$0.916562500002328#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary FastestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary EventDescription_sorted#$1$LMF: Improve Stability values, lower values.#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary Value_LastSample_sorted#$1$0.916#$1$#C0C0C0#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep00','00: Sample Evaluation','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep01,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestTimeToSevere_sorted#$1$34.992#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestGasPPM_sorted#$1$439.5#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestSeverePer_sorted#$1$36.625#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestCombustiblePer_sorted#$1$95.027#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary AuxVal01ON_sorted#$1$10#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01Days_sorted#$1$1.64800000000105#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary ChangeWorstPos_sorted#$1$#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastmonthsToSevere_DifPrev_sorted#$1$3.552#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted#$1$3.552#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep01,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestTimeToSevere_sorted#$1$96.628#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestGasPPM_sorted#$1$261.5#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestSeverePer_sorted#$1$21.792#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestCombustiblePer_sorted#$1$93.41#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary AuxVal01ON_sorted#$1$-#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01Days_sorted#$1$-#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary ChangeWorstPos_sorted#$1$#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastmonthsToSevere_DifPrev_sorted#$1$15.353#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted#$1$15.353#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep01','01: Fastest to Severe','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep02,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestGasRate_sorted#$1$21.721#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestGasPPM_sorted#$1$439.5#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestSeverePer_sorted#$1$36.625#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestCombustiblePer_sorted#$1$95.027#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary FastmonthsToSevere_DifPrev_sorted#$1$0#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted#$1$3.552#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep02,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestGasRate_sorted#$1$9.711#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestGasPPM_sorted#$1$261.5#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestSeverePer_sorted#$1$21.792#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary HighestCombustiblePer_sorted#$1$93.41#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary FastmonthsToSevere_DifPrev_sorted#$1$15.353#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted#$1$15.353#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep02','02: Highest Rate','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep03,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TotalComb_sorted#$1$462.5#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TotalCO2_sorted#$1$1728#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RelCO2CO_sorted#$1$3.932#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary RelO2N2_sorted#$1$24.777#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary CombTimeToSevere_sorted#$1$71.256#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary CO2TimeToSevere_sorted#$1$90.87#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary CO2COTimeToSevere_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary O2N2TimeToSevere_sorted#$1$1.158#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep03,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TotalComb_sorted#$1$279.95#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TotalCO2_sorted#$1$1284#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RelCO2CO_sorted#$1$4.91#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary RelO2N2_sorted#$1$56.478#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary CombTimeToSevere_sorted#$1$160.461#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary CO2TimeToSevere_sorted#$1$172.726#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary CO2COTimeToSevere_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary O2N2TimeToSevere_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep03','03: Gas - Ratios & Time','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep04,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AMI_WeighedGasDecay_sorted#$1$15.09#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary ANSI_WeighedGasDecay_sorted#$1$13.75#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AMI_Code_sorted#$1$1#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary ANSI_Code_sorted#$1$1#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Monitor_EqHydran_sorted#$1$449.529#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PossibleHydran_EqHydran_sorted#$1$85.917#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep04,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AMI_WeighedGasDecay_sorted#$1$12.56#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary ANSI_WeighedGasDecay_sorted#$1$11.25#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AMI_Code_sorted#$1$1#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary ANSI_Code_sorted#$1$1#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Monitor_EqHydran_sorted#$1$270.086#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PossibleHydran_EqHydran_sorted#$1$54.012#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep04','04: Gas - Decay','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep05,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_MonthsGas1_sorted#$1$34.992#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_IDGas2_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_MonthsGas2_sorted#$1$777.914#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_IDGas3_sorted#$1$H2- Hydrogen#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_MonthsGas3_sorted#$1$960#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep05,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_MonthsGas1_sorted#$1$96.628#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_IDGas2_sorted#$1$C2H6- Ethane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_MonthsGas2_sorted#$1$319.009#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_IDGas3_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByTimeToSevere_MonthsGas3_sorted#$1$960#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep05','05: Ranking by Time to Severe Limit','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep06,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_percCombGas1_sorted#$1$95.027#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary RankByParticipation_IDGas2_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_percCombGas2_sorted#$1$2.309#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_IDGas3_sorted#$1$H2- Hydrogen#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_percCombGas3_sorted#$1$1.461#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep06,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_percCombGas1_sorted#$1$93.41#$1$#FFFF00#$1$#FF0000#$2$GasOnLineSummary RankByParticipation_IDGas2_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_percCombGas2_sorted#$1$2.473#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_IDGas3_sorted#$1$H2- Hydrogen#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByParticipation_percCombGas3_sorted#$1$2.471#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep06','06: Ranking by Participation','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep07,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_percLimitGas1_sorted#$1$36.625#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_IDGas2_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_percLimitGas2_sorted#$1$2.67#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_IDGas3_sorted#$1$C2H6- Ethane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_percLimitGas3_sorted#$1$1.909#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep07,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_percLimitGas1_sorted#$1$21.792#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_IDGas2_sorted#$1$C2H6- Ethane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_percLimitGas2_sorted#$1$2.452#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_IDGas3_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankBySevereLimit_percLimitGas3_sorted#$1$1.731#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep07','07: Ranking by Severe Limit','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep08,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_ppm30daysGas1_sorted#$1$21.721#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_IDGas2_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_ppm30daysGas2_sorted#$1$0.5#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_IDGas3_sorted#$1$H2- Hydrogen#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_ppm30daysGas3_sorted#$1$0.409#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep08,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_IDGas1_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_ppm30daysGas1_sorted#$1$9.711#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_IDGas2_sorted#$1$C2H6- Ethane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_ppm30daysGas2_sorted#$1$0.367#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_IDGas3_sorted#$1$CH4- Methane#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary RankByRateofGeneration_ppm30daysGas3_sorted#$1$0.336#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep08','08: Ranking by Rate of Generation','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep09,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestTimeToSevere_sorted#$1$34.992#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastmonthsToSevere_DifPrev_sorted#$1$3.552#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted#$1$3.552#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Monitor_DifPrev_sorted#$1$3.373#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary EqHydran_DifPrev_sorted#$1$0.52#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_IncreaseSlope_sorted#$1$14#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_ReduceSlope_sorted#$1$13#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_IncreaseR2_sorted#$1$12#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_ReduceR2_sorted#$1$15#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep09,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestTimeToSevere_sorted#$1$96.628#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastestKeyGas_sorted#$1$CO#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary FastmonthsToSevere_DifPrev_sorted#$1$15.353#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary HighestmonthsToSevere_DifPrev_sorted#$1$15.353#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Monitor_DifPrev_sorted#$1$8.762#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary EqHydran_DifPrev_sorted#$1$1.938#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_IncreaseSlope_sorted#$1$12#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_ReduceSlope_sorted#$1$10#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_IncreaseR2_sorted#$1$7#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AmbTemp_ReduceR2_sorted#$1$15#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep09','09: Previous & Ambient Temp Change','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep10,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_Date_LastAux_sorted#$1$27 May 2024#$1$#008080#$1$#FFFF00#$2$GasOnLineSummary AuxVal01_DifDate#$1$1.64800000000105#$1$#008080#$1$#FFFF00#$2$GasOnLineSummary AuxVal01_ShortID_sorted#$1$TimeClear.OL_A#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_Description_sorted#$1$Time to Clear Over Load, Aph#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_IncreaseSlope_sorted#$1$10#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ReduceSlope_sorted#$1$17#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_IncreaseR2_sorted#$1$15#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ReduceR2_sorted#$1$12#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep10,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_Date_LastAux_sorted#$1$27 May 2024#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_DifDate#$1$0.509999999994761#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ShortID_sorted#$1$ArcStability#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_Description_sorted#$1$Arc Stability#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_IncreaseSlope_sorted#$1$11#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ReduceSlope_sorted#$1$11#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_IncreaseR2_sorted#$1$12#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ReduceR2_sorted#$1$10#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep10','10: Process - Effect','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep11,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ShortID_sorted#$1$TimeClear.OL_A#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AuxVal01_ID_sorted#$1$CH4- Methane#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AuxVal01_ExistingVal_sorted#$1$-1.1843826#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AuxVal01_ChangePerc_sorted#$1$642.182#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AuxVal01_ID_sorted#$1$CO#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AuxVal01_ExistingVal_sorted#$1$1.5010004#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AuxVal01_ChangePerc_sorted#$1$-33.41#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AuxVal01_ID_sorted#$1$H2- Hydrogen#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AuxVal01_ExistingVal_sorted#$1$0.0407639#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AuxVal01_ChangePerc_sorted#$1$-78.512#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep11,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ShortID_sorted#$1$ArcStability#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AuxVal01_ID_sorted#$1$C2H6- Ethane#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AuxVal01_ExistingVal_sorted#$1$-0.1512416#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AuxVal01_ChangePerc_sorted#$1$-98.064#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AuxVal01_ID_sorted#$1$CH4- Methane#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AuxVal01_ExistingVal_sorted#$1$0.4125383#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AuxVal01_ChangePerc_sorted#$1$172.161#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AuxVal01_ID_sorted#$1$CO#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AuxVal01_ExistingVal_sorted#$1$1.2411846#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AuxVal01_ChangePerc_sorted#$1$81.033#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep11','11: Gas Correlation - Process','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep12,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ShortID_sorted#$1$TimeClear.OL_A#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AmbTemp_ID_sorted#$1$CH4- Methane#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AmbTemp_ExistingVal_sorted#$1$-0.0440552#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AmbTemp_ChangePerc_sorted#$1$-86.291#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AmbTemp_ID_sorted#$1$CO#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AmbTemp_ExistingVal_sorted#$1$-0.1776211#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AmbTemp_ChangePerc_sorted#$1$-74.198#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AmbTemp_ID_sorted#$1$H2- Hydrogen#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AmbTemp_ExistingVal_sorted#$1$0.0134435#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AmbTemp_ChangePerc_sorted#$1$260.599#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep12,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AuxVal01_ShortID_sorted#$1$ArcStability#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AmbTemp_ID_sorted#$1$C2H6- Ethane#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AmbTemp_ExistingVal_sorted#$1$0.013086#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasA_AmbTemp_ChangePerc_sorted#$1$85.754#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AmbTemp_ID_sorted#$1$CH4- Methane#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AmbTemp_ExistingVal_sorted#$1$0.0293049#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasB_AmbTemp_ChangePerc_sorted#$1$41.589#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AmbTemp_ID_sorted#$1$CO#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AmbTemp_ExistingVal_sorted#$1$0.3154438#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary KeyGasC_AmbTemp_ChangePerc_sorted#$1$86.401#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep12','12: Gas Correlation - Ambient Temp','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep13,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio1_CH4_H2_sorted#$1$1.58#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_Ratio1_CH4_H2_sorted#$1$-0.328#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio2_C2H2_C2H4_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio2_C2H2_C2H4_sorted#$1$-0.16#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio3_C2H2_CH4_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio3_C2H2_CH4_sorted#$1$-0.032#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio4_C2H6_C2H2_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio4_C2H6_C2H2_sorted#$1$-3.281#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio5_C2H4_C2H6_sorted#$1$1.428#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_Ratio5_C2H4_C2H6_sorted#$1$-0.476#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio_ThermalR4_R2_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio_ThermalR4_R2_sorted#$1$-26.231#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary MonthsToSeverR2R5_Discharge_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_MonthsToSeverR2R5_Discharge_sorted#$1$-3.405#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep13,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio1_CH4_H2_sorted#$1$1.001#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio1_CH4_H2_sorted#$1$0.026#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio2_C2H2_C2H4_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio2_C2H2_C2H4_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio3_C2H2_CH4_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio3_C2H2_CH4_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio4_C2H6_C2H2_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio4_C2H6_C2H2_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio5_C2H4_C2H6_sorted#$1$0.567#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio5_C2H4_C2H6_sorted#$1$-0.091#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Ratio_ThermalR4_R2_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Ratio_ThermalR4_R2_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary MonthsToSeverR2R5_Discharge_sorted#$1$0#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_MonthsToSeverR2R5_Discharge_sorted#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep13','13: Gas Ratios - Arcing & Thermal','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep14,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Oil_BottomTemperature_sorted#$1$29.397#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_Oil_BottomTemperature_sorted#$1$0.271#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary AmbientTemperature_sorted#$1$25.828#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_AmbientTemperature_sorted#$1$0.216#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Oil_MoistureContent_sorted#$1$1.967#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Oil_MoistureContent_sorted#$1$0.001#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary O2_ppm_sorted#$1$4302.39#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_O2_ppm_sorted#$1$-2.41#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary N2_ppm_sorted#$1$13748.073#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_N2_ppm_sorted#$1$281.59#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Oil_Pressure_sorted#$1$29.017#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_Oil_Pressure_sorted#$1$0.047#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep14,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Oil_BottomTemperature_sorted#$1$27.496#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Oil_BottomTemperature_sorted#$1$0.109#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary AmbientTemperature_sorted#$1$24.162#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_AmbientTemperature_sorted#$1$0.655#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary Oil_MoistureContent_sorted#$1$6.544#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_Oil_MoistureContent_sorted#$1$0.023#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary O2_ppm_sorted#$1$6235.174#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_O2_ppm_sorted#$1$34.641#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary N2_ppm_sorted#$1$10887.446#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_N2_ppm_sorted#$1$631.413#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary Oil_Pressure_sorted#$1$25.674#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_Oil_Pressure_sorted#$1$-0.021#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep14','14: System Variables','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep15,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_C2H2_Acetylene#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_C2H2_Acetylene#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_H2_Hydrogen#$1$6.964#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_H2_Hydrogen#$1$0.187#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary LastN_C2H4_Ethylene#$1$3.116#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_C2H4_Ethylene#$1$-0.095#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_C2H6_Ethane#$1$2.23#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_C2H6_Ethane#$1$0.08#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_CH4_Methane#$1$11.403#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_CH4_Methane#$1$-0.346#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_CO#$1$438.46#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_CO#$1$3.32#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep15,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_C2H2_Acetylene#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_C2H2_Acetylene#$1$-#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_H2_Hydrogen#$1$6.659#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_H2_Hydrogen#$1$0.102#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_C2H4_Ethylene#$1$1.511#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_C2H4_Ethylene#$1$-0.084#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_C2H6_Ethane#$1$2.633#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_C2H6_Ethane#$1$-0.075#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_CH4_Methane#$1$7.343#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_CH4_Methane#$1$0.334#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_CO#$1$260.69#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_CO#$1$7.24#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep15','15: Gas Content last N samples','GasOnLineSummary'
exec sp_actualizaValorGOL 'Rep16,KyoeiSG_Alta_EAF_67599_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$1#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_EAF_67599_MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67599#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LocalName_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary SystemType_sorted#$1$EAF#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$28 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_Combustible#$1$462.189#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_Combustible#$1$3.003#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_Decay_ANSI#$1$21.079#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_Decay_ANSI#$1$-9.561#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_Decay_AMI#$1$82.867#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary difPre_LastN_Decay_AMI#$1$-9.278#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$5.5491#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$5.9998#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$-#$1$#008080#$1$#FFFFFF'
exec sp_actualizaValorGOL 'Rep16,KyoeiSG_Alta_LMF_67585_MT','GasOnLineSummary idCustomer#$1$KyoeiSG#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Item#$1$2#$1$#0000FF#$1$#FFFFFF#$2$GasOnLineSummary ComboGasKey_sorted#$1$KyoeiSG_Alta_LMF_67585_MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary PlantLocation_sorted#$1$Edmonton, AB, CAN#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TxUnit_Man_SN_sorted#$1$Tamini 67585#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary LocalName_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary SystemType_sorted#$1$LMF#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary TypeOfTankShort_sorted#$1$MT#$1$#3366FF#$1$#CCFFFF#$2$GasOnLineSummary Date_LastSample_sorted#$1$27 May 2024#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_Combustible#$1$278.84#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_Combustible#$1$7.517#$1$#3366FF#$1$#FFFF00#$2$GasOnLineSummary LastN_Decay_ANSI#$1$20.893#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_Decay_ANSI#$1$4.264#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary LastN_Decay_AMI#$1$24.472#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary difPre_LastN_Decay_AMI#$1$7.645#$1$#3366FF#$1$#FFFFFF#$2$GasOnLineSummary Days_PrevRevision_sorted#$1$23.4995#$1$#008080#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_sorted#$1$10.0434#$1$#FF0000#$1$#FFFFFF#$2$GasOnLineSummary sampleHrs_New_sorted#$1$12#$1$#FF0000#$1$#FFFFFF'
exec sp_actualizaTitRepSumGOL 'Rep16','16: Gas Content last N samples - Total Decay','GasOnLineSummary'
exec sp_actualizaFechasGOL 'KyoeiSG_Alta_EAF_67599_MT','2022/01/02,2026/01/05,2024/04/01,2024/08/05'
exec sp_actualizaFechasGOL 'KyoeiSG_Alta_LMF_67585_MT','2022/01/02,2026/01/05,2024/04/01,2024/08/05'
exec sp_actualizaSortRef 'RepList,0','Rep00,00: Sample Evaluation,ComboGasKey_sorted,4,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,1','Rep01,01: Fastest to Severe,FastestTimeToSevere_sorted,12,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,2','Rep02,02: Highest Rate,HighestGasRate_sorted,12,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,3','Rep03,03: Gas - Ratios & Time,TotalComb_sorted,12,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,4','Rep04,04: Gas - Decay,AMI_WeighedGasDecay_sorted,12,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,5','Rep05,05: Ranking by Time to Severe Limit,RankByTimeToSevere_MonthsGas1_sorted,13,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,6','Rep06,06: Ranking by Participation,RankByParticipation_percCombGas1_sorted,13,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,7','Rep07,07: Ranking by Severe Limit,RankBySevereLimit_percLimitGas1_sorted,13,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,8','Rep08,08: Ranking by Rate of Generation,RankByRateofGeneration_ppm30daysGas1_sorted,13,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,9','Rep09,09: Previous & Ambient Temp Change,FastestTimeToSevere_sorted,12,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,10','Rep10,10: Process - Effect,FastestTimeToSevere_sorted,x,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,11','Rep11,11: Gas Correlation - Process,FastestTimeToSevere_sorted,x,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,12','Rep12,12: Gas Correlation - Ambient Temp,FastestTimeToSevere_sorted,x,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,13','Rep13,13: Gas Ratios - Arcing & Thermal,FastestTimeToSevere_sorted,x,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,14','Rep14,14: System Variables,FastestTimeToSevere_sorted,x,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,15','Rep15,15: Gas Content last N samples,FastestTimeToSevere_sorted,x,GasOnLineSummary'
exec sp_actualizaSortRef 'RepList,16','Rep16,16: Gas Content last N samples - Total Decay,FastestTimeToSevere_sorted,x,GasOnLineSummary'
