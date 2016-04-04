-- =============================================
-- Author:		Gustavo Mejía Díaz
-- Create date: 02/04/2016
-- Description:	Procedimiento que inserta,edita o elimina un registro en la tabla Personas
-- =============================================


CREATE PROCEDURE SP_Mantenimiento_Personas 
	@@accion int,--Indica si la operación a realizar es un I=Insert, U=Update o un D=Delete
	@@cedula varchar(50),
	@@nombre varchar(50),
	@@apellidos varchar(200),
	@@telefono varchar(9),
	@@direccion varchar(400)
AS
BEGIN
	SET NOCOUNT ON;

	--Declaro las variables que se utilizarán en el insert, no las inserto de una vez desde el parámetro
	--por un tema de rendimiento.
	DECLARE @accion int
	DECLARE @cedula varchar(50)
	DECLARE @nombre varchar(50)
	DECLARE @apellidos varchar(200)
	DECLARE @telefono varchar(9)
	DECLARE @direccion varchar(400)

	--Seteo las variables locales, con las suministradas en los parámetros
	SET @accion=@@accion
	SET @cedula=@@cedula
	SET @nombre=@@nombre
	SET @apellidos=@@apellidos
	SET @telefono=@@telefono
	SET @direccion=@@direccion


	IF(@accion='I') --Efectúo las operación de Insert
	BEGIN
	    ---Primero compruebo que no exista un registro con el id a insertar
		IF NOT EXISTS(SELECT 1 FROM dbo.T_Personas WHERE Cedula=@cedula)
		BEGIN
			INSERT INTO dbo.T_Personas(Cedula,Nombre,Apellidos,Telefono,Direccion)
				VALUES(@cedula,@nombre,@apellidos,@telefono,@direccion)
			SELECT 'Registro Insertado con Éxito'
		END
		ELSE
		BEGIN
			SELECT 'Error: Ya existe un registro con el mismo ID'
		END
	END
	
	IF(@accion='U') --Efectúo las operación de Update
	BEGIN
		--Primero compruebo que exista un registro para actualizar
		IF EXISTS(SELECT 1 FROM dbo.T_Personas WHERE Cedula=@cedula)
		BEGIN
			UPDATE dbo.T_Personas
				SET Nombre=@nombre,
					Apellidos=@apellidos,
					Telefono=@telefono,
					Direccion=@direccion
			WHERE Cedula=@cedula

			SELECT 'Registro Actualizado con Éxito'
		END
		ELSE
		BEGIN
			SELECT 'Error: No se encuentra el registro para actualizar' 
		END 
	END
	
	IF(@accion='D') --Efectúo las operación de Delete
	BEGIN
		--Primero compruebo que exista un registro para eliminarlo
		IF EXISTS(SELECT 1 FROM dbo.T_Personas WHERE Cedula=@cedula)
		BEGIN
			DELETE FROM dbo.T_Personas WHERE Cedula=@cedula
			
			SELECT 'Registro Eliminado con Éxito'
		END
		ELSE
		BEGIN
			SELECT 'Error: No se encuentra  el registro para eliminar'
		END
	END

END