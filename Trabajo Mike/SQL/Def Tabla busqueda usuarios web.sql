CREATE VIEW [dbo].[vwUsuarios_Clientes_Internos]
AS
SELECT DISTINCT idUser AS ID, username, ISNULL(NombreCliente, '') AS nombreCliente
FROM         dbo.vwUsuarios_Categorias AS vUC
WHERE     (idUser <> 1)
UNION
SELECT DISTINCT u.ID, u.username, 'AMIGE' AS nombreCliente
FROM         dbo.Usuarios AS u INNER JOIN
                      dbo.usuarios_grupoTrabajo AS ug ON u.ID = ug.idUsuario INNER JOIN
                      dbo.roles AS r ON ug.idRol = r.idRol
WHERE     (r.isInterno = 1) AND (u.ID <> 1) AND (u.ID NOT IN
                          (SELECT DISTINCT idUser
                            FROM          dbo.vwUsuarios_Categorias))
UNION
SELECT DISTINCT ID, username, '' AS nombreCliente
FROM         dbo.Usuarios AS u
WHERE     (ID <> 1) AND (ID NOT IN
                          (SELECT DISTINCT idUser
                            FROM          dbo.vwUsuarios_Categorias AS vwUsuarios_Categorias_1)) AND (ID NOT IN
                          (SELECT     u.idUsuario
                            FROM          dbo.usuarios_grupoTrabajo AS u INNER JOIN
                                                   dbo.roles AS r ON u.idRol = r.idRol
                            WHERE      (r.isInterno = 1)))