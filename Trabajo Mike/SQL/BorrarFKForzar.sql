SELECT name
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('dbo.Usuarios_gas');

-- Buscar restricciones de clave externa que referencian a ml_Gas_Alerta
SELECT name
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('dbo.ml_Gas_Alerta');

-- Buscar restricciones de clave externa que referencian a ml_LlavesG
SELECT name
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('dbo.ml_LlavesG');

-- Buscar restricciones de clave externa que referencian a ml_Tendencia
SELECT name
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('dbo.ml_Tendencia');

-- Buscar restricciones de clave externa que referencian a ml_Gas_Limite
SELECT name
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('dbo.ml_Gas_Limite');

ALTER TABLE dbo.ml_LlavesG DROP CONSTRAINT FK_ml_LlavesG_idGas;

-- Eliminar tablas
DROP TABLE IF EXISTS dbo.Usuarios_gas;
DROP TABLE IF EXISTS dbo.ml_Gas_Alerta;
DROP TABLE IF EXISTS dbo.ml_LlavesG;
DROP TABLE IF EXISTS dbo.ml_Tendencia;
DROP TABLE IF EXISTS dbo.ml_Gas_Limite;



ALTER TABLE dbo.ml_LlavesG DROP CONSTRAINT FK_ml_LlavesG_idUsuario;
ALTER TABLE dbo.ml_LlavesG DROP CONSTRAINT FK_ml_LlavesG_GasAlerta;
ALTER TABLE dbo.ml_LlavesG DROP CONSTRAINT FK_ml_LlavesG_idTend;
ALTER TABLE dbo.ml_LlavesG DROP CONSTRAINT FK_ml_LlavesG_idGas;

ALTER TABLE dbo.Usuarios_Gas DROP CONSTRAINT FK__Usuarios___idAle__428AB4D9;
ALTER TABLE dbo.Usuarios_Gas DROP CONSTRAINT FK__Usuarios___idLla__419690A0;

ALTER TABLE dbo.ml_Gas_Alerta DROP CONSTRAINT FK__ml_Gas_Al__idGas__3EBA23F5;
ALTER TABLE dbo.ml_Gas_Alerta DROP CONSTRAINT FK__ml_Gas_Al__idTen__3CD1DB83;