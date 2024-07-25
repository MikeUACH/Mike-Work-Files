/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [idgpo_trabajo]
      ,[name]
      ,[description]
      ,[admin]
      ,[rootPath]
      ,[prefijo_Autofill]
      ,[rutaAttachments]
      ,[rutaVirtual]
  FROM [dbo].[grupoTrabajo]


    SELECT * FROM [dbo].[vwUsuarios_Clientes_Internos]  WHERE username LIKE 'pe%'
  SELECT * FROM vwUsuarios_Categorias WHERE username LIKE 'pe%' OR nombrecliente LIKE 'AMI%';
  SELECT * FROM vwUsuarios_Clientes_Internos
  INSERT INTO vwUsuarios_Clientes_Internos(

  SELECT * FROM Usuarios WHERE username LIKE 'petronila%';
  SEleCT * FROM Usuarios WHERE id=6
  SELECT OBJECT_DEFINITION(OBJECT_ID('vwUsuarios_Categorias')) AS ViewDefinition;

  SELECT * FROM vwUsuarios_Clientes_Internos WHERE username = 'petronila';

  SELECT u.*, ug.*, r.*
FROM Usuarios u
LEFT JOIN usuarios_grupoTrabajo ug ON u.ID = ug.idUsuario
LEFT JOIN roles r ON ug.idRol = r.idRol
WHERE u.username = 'petronila';

SELECT * FROM Usuarios WHERE username = 'petronila' AND IsDisabled = 0 AND statusActivo = 1;

SELECT OBJECT_DEFINITION(OBJECT_ID('vwUsuarios_Clientes_Internos')) AS ViewDefinition;

SELECT u.ID, u.username, ug.idgpo_trabajo AS idGrupo, g.GroupName, r.idRol, r.isInterno, g.IsAdmin
FROM Usuarios u
LEFT JOIN usuarios_grupoTrabajo ug ON u.ID = ug.idUsuario
LEFT JOIN Groups g ON ug.idgpo_trabajo = g.GroupID
LEFT JOIN roles r ON ug.idRol = r.idRol
WHERE u.username = 'petronila';

  UPDATE Usuarios
SET IsDisabled = 0, statusActivo = 1
WHERE username = 'petronila';


update Usuarios SET email= 'antonio.mariscal@amige.com' where username = 'petronila'


SELECT * FROM vwUsuarios_Categorias WHERE nombrecliente LIKE '%AMI%';


SELECT * FROM Groups WHERE GroupID = 1;

ALTER VIEW [dbo].[vwUsuarios_Clientes_Internos] AS
SELECT DISTINCT idUser AS ID, username, ISNULL(NombreCliente, '') AS nombreCliente
FROM dbo.vwUsuarios_Categorias AS vUC
WHERE (idUser <> 1)
UNION
SELECT DISTINCT u.ID, u.username, 'AMIGE' AS nombreCliente
FROM dbo.Usuarios AS u
INNER JOIN dbo.usuarios_grupoTrabajo AS ug ON u.ID = ug.idUsuario
INNER JOIN dbo.roles AS r ON ug.idRol = r.idRol
WHERE (r.isInterno = 1) AND (u.ID <> 1) AND (u.ID NOT IN
    (SELECT DISTINCT idUser FROM dbo.vwUsuarios_Categorias))
UNION
SELECT DISTINCT ID, username, '' AS nombreCliente
FROM dbo.Usuarios AS u
WHERE (ID <> 1) AND (ID NOT IN
    (SELECT DISTINCT idUser FROM dbo.vwUsuarios_Categorias)) AND (ID NOT IN
    (SELECT u.idUsuario FROM dbo.usuarios_grupoTrabajo AS u
     INNER JOIN dbo.roles AS r ON u.idRol = r.idRol
     WHERE (r.isInterno = 1)))
UNION
-- Añadimos los administradores
SELECT DISTINCT u.ID, u.username, 'Admin' AS nombreCliente
FROM dbo.Usuarios AS u
INNER JOIN dbo.usuarios_grupoTrabajo AS ug ON u.ID = ug.idUsuario
INNER JOIN dbo.Groups AS g ON ug.idgpo_trabajo = g.GroupID
WHERE g.IsAdmin = 1 AND u.ID <> 1;


SELECT * from dbo.usuarios_grupoTrabajo

-- Para la tabla usuarios_grupoTrabajo
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'usuarios_grupoTrabajo';

-- Para la tabla Groups
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Groups';


SELECT u.ID, u.username, ug.idgpo_trabajo AS idGrupo, g.GroupName, ug.idRol, r.isInterno, g.IsAdmin
FROM Usuarios u
LEFT JOIN usuarios_grupoTrabajo ug ON u.ID = ug.idUsuario
LEFT JOIN Groups g ON ug.idgpo_trabajo = g.GroupID
LEFT JOIN roles r ON ug.idRol = r.idRol
WHERE u.username = 'petronila';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'usuarios_grupoTrabajo';


-- Verificar los datos en usuarios_grupoTrabajo para el usuario petronila
SELECT *
FROM usuarios_grupoTrabajo
WHERE idUsuario = (SELECT ID FROM Usuarios WHERE username = 'petronila');

-- Verificar los datos en Groups para los grupos asociados
SELECT *
FROM Groups
WHERE GroupID IN (SELECT idgpo_trabajo FROM usuarios_grupoTrabajo WHERE idUsuario = (SELECT ID FROM Usuarios WHERE username = 'petronila'));

-- Verificar los datos en roles para los roles asociados
SELECT *
FROM roles
WHERE idRol IN (SELECT idRol FROM usuarios_grupoTrabajo WHERE idUsuario = (SELECT ID FROM Usuarios WHERE username = 'petronila'));

SELECT *
FROM Usuarios
WHERE username = 'petronila';


SELECT *
FROM usuarios_grupoTrabajo
WHERE idUsuario = (SELECT ID FROM Usuarios WHERE username = 'petronila');

-- Verificar datos en Groups
SELECT *
FROM Groups;

-- Verificar datos en roles
SELECT *
FROM roles;





-- Verificar relación entre usuarios_grupoTrabajo y Groups
SELECT DISTINCT ug.idgpo_trabajo
FROM usuarios_grupoTrabajo ug
LEFT JOIN Groups g ON ug.idgpo_trabajo = g.GroupID
WHERE ug.idUsuario = (SELECT ID FROM Usuarios WHERE username = 'petronila');

-- Verificar relación entre usuarios_grupoTrabajo y roles
SELECT DISTINCT ug.idRol
FROM usuarios_grupoTrabajo ug
LEFT JOIN roles r ON ug.idRol = r.idRol
WHERE ug.idUsuario = (SELECT ID FROM Usuarios WHERE username = 'petronila');

	SELECT *
	FROM usuarios_grupoTrabajo;

-- Obtener el ID del usuario petronila
DECLARE @userId INT;
SET @userId = (SELECT ID FROM Usuarios WHERE username = 'petronila');

-- Insertar datos de prueba en usuarios_grupoTrabajo
-- Asumiendo que 'lastIdCategoria' requiere un valor, aquí usamos 1 como un ejemplo
INSERT INTO usuarios_grupoTrabajo (idUsuario, idgpo_trabajo, idRol, isRep, lastIdCategoria)
VALUES (@userId, 1, 1, 0, 1); -- Ajusta este valor según sea necesario

-- Asegúrate de que también hay datos en Groups y roles para estos valores
INSERT INTO Groups (GroupID, GroupName, IsAdmin) VALUES (1, 'Test Group', 0);
INSERT INTO roles (idRol, isInterno) VALUES (1, 1);

DELETE FROM usuarios_grupoTrabajo where idUsuario= 1;
select * from usuarios_grupoTrabajo
select * from Groups
SELECT * FROM Usuarios where id= 3

select * from vwUsuario_GrupoTrabajo


