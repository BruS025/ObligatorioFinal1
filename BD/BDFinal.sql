USE master
GO

-- Elimino base de datos Obligatorio si ya existe...
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OBLIGATORIOFINAL')
BEGIN
	DROP DATABASE OBLIGATORIOFINAL
END 
GO

-- Creo la Base de Datos
CREATE DATABASE OBLIGATORIOFINAL
GO

USE OBLIGATORIOFINAL
GO

--Creo la tabla Usuarios
CREATE TABLE Usuario
(
	IdLogueo INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR (20) NOT NULL,
	Contrasenia VARCHAR(20) NOT NULL,
	NroDoc INT NOT NULL,
	NombreLogueo VARCHAR(20) NOT NULL
)
GO
--Creo la tabla Cliente
CREATE TABLE Cliente
(
	IdLogueo INT PRIMARY KEY FOREIGN KEY REFERENCES Usuario(IdLogueo) ON DELETE CASCADE,
	NroTarjeta BIGINT NOT NULL,
	Calle VARCHAR(20) NOT NULL,
	NroPuerta INT NOT NULL
)
GO
--Creo la tabla Administrador
CREATE TABLE Administrador
(
	IdLogueo INT PRIMARY KEY FOREIGN KEY REFERENCES Usuario(IdLogueo) ON DELETE CASCADE,
	Cargo VARCHAR(20)
)
GO
--Creo la tabla Especializacion
CREATE TABLE Especializacion
(
	Tipo VARCHAR(20) NOT NULL,
	IdEspe INT PRIMARY KEY IDENTITY(1,1)
)
GO
--Creo la tabla Casa
CREATE TABLE Casa   
(
	Rut BIGINT NOT NULL PRIMARY KEY,
	IdEspe INT NOT NULL,
	Nombre VARCHAR (20) NOT NULL
)
GO
--Creo la tabla Plato
CREATE TABLE Plato 
(
	IdPlato INT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Precio INT NOT NULL
)
GO
--Creo la tabla Tienen
CREATE TABLE Tienen
(
	Rut BIGINT FOREIGN KEY REFERENCES Casa(Rut) ON DELETE CASCADE,
	IdPlato INT FOREIGN KEY REFERENCES Plato(IdPlato) ON DELETE CASCADE,
	PRIMARY KEY(Rut,IdPlato)
)
GO
--Creo la tabla Pedido
CREATE TABLE Pedido
(
	IdPedido INT PRIMARY KEY NOT NULL,
	Cantidad INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Entregado BIT NOT NULL
)
GO
--Creo la tabla Compran
CREATE TABLE Compran
(
	IdPlato INT FOREIGN KEY REFERENCES Plato(IdPlato) ON DELETE CASCADE,
	IdLogueo INT FOREIGN KEY REFERENCES Usuario(IdLogueo) ON DELETE CASCADE
)
GO
--Creo la tabla Realizan
CREATE TABLE Realizan
(
	IdPlato INT FOREIGN KEY REFERENCES Plato(IdPlato) ON DELETE CASCADE,
	IdLogueo INT FOREIGN KEY REFERENCES Usuario(IdLogueo),
	IdPedido INT NOT NULL PRIMARY KEY IDENTITY (1,1)
)
GO

--Creo SP Necesarios Clientes
CREATE PROCEDURE SP_AgregarCliente
@NombreN VARCHAR(20) ,
@ApellidoN VARCHAR (20),
@ContraseniaN VARCHAR(20),
@NroDocN INT,
@NombreLogueoN VARCHAR(20),
@NroTarjetaN BIGINT,
@CalleN VARCHAR(20),
@NroPuertaN INT
AS
BEGIN
	
	IF EXISTS (SELECT U.NroDoc FROM Usuario U WHERE U.NroDoc = @NroDocN)
		BEGIN
			RETURN -1
		END
	IF EXISTS (SELECT U.NombreLogueo FROM Usuario U WHERE U.NombreLogueo = @NombreLogueoN)
		BEGIN
			RETURN -2
		END
	ELSE
		BEGIN TRANSACTION
				INSERT INTO Usuario (Nombre,Apellido,Contrasenia,NroDoc,NombreLogueo)
				VALUES (@NombreN,@ApellidoN,@ContraseniaN,@NroDocN,@NombreLogueoN)
					
				IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRANSACTION
						RETURN @@ERROR
					END

			INSERT INTO Cliente (IdLogueo,NroTarjeta,Calle,NroPuerta)
			VALUES((SELECT max(IdLogueo) FROM Usuario),@NroTarjetaN,@CalleN,@NroPuertaN)

				IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRANSACTION
						RETURN @@ERROR
					END
				ELSE 
					BEGIN
						COMMIT TRANSACTION
						RETURN 1
					END
		END	
GO
DECLARE @RETORNO INT
EXEC @RETORNO = SP_AgregarCliente pruebacliente,pruebacliente,pass1,123456,pruebacliente,123456789000,calle1,1414
PRINT @retorno
go
-- -1 documento existente -2 nombrelogueo existente 

--SP Necesarios para administradores
CREATE PROCEDURE SP_AgregarAdministrador
@NombreN VARCHAR(20) ,
@ApellidoN VARCHAR (20),
@ContraseniaN VARCHAR(20),
@NroDocN INT,
@NombreLogueoN VARCHAR(20),
@CargoN VARCHAR(20)
AS
BEGIN
	
	IF EXISTS (SELECT U.NroDoc FROM Usuario U WHERE U.NroDoc = @NroDocN)
		BEGIN
			RETURN -1
		END
			IF EXISTS (SELECT U.NombreLogueo FROM Usuario U WHERE U.NombreLogueo = @NombreLogueoN)
		BEGIN
			RETURN -2
		END
	ELSE
		BEGIN TRANSACTION
				INSERT INTO Usuario (Nombre,Apellido,Contrasenia,NroDoc,NombreLogueo)
				VALUES (@NombreN,@ApellidoN,@ContraseniaN,@NroDocN,@NombreLogueoN)
					
				IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRANSACTION
						RETURN @@ERROR
					END

			INSERT INTO Administrador (IdLogueo,Cargo)
			VALUES((SELECT max(IdLogueo) FROM Usuario),@CargoN)

				IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRANSACTION
						RETURN @@ERROR
					END
				ELSE 
					BEGIN
						COMMIT TRANSACTION
						RETURN 1
					END
		END	
GO
DECLARE @RETORNO INT
EXEC @RETORNO = SP_AgregarAdministrador pruebaAdmin,pruebaAdmin,pass1,123456789,uadminn1,pruebaadmin
PRINT @retorno
-- -1 documento existente -2 nombrelogueo existente 
GO
CREATE PROCEDURE SP_ModificarAdministrador
@NombreM VARCHAR(20),
@ApellidoM VARCHAR (20),
@ContraseniaM VARCHAR(20),
@NroDocM INT,
@NombreLogueoM VARCHAR(20),
@CargoM VARCHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT U.NroDoc FROM Usuario U WHERE U.NroDoc = @NroDocM)
		BEGIN
			RETURN -1
		END
	ELSE
		BEGIN TRANSACTION
			
			UPDATE Usuario
			SET
				Nombre=@NombreM,
				Apellido=@ApellidoM,
				Contrasenia=@ContraseniaM,
				NombreLogueo=@NombreLogueoM
			WHERE
				Usuario.NroDoc=@NroDocM

			IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END

			UPDATE Administrador
			SET
				Cargo=@CargoM
			WHERE
				Administrador.IdLogueo =(SELECT U.IdLogueo FROM Usuario U WHERE U.NroDoc=@NroDocM)

			IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
       ELSE
			BEGIN
				COMMIT TRANSACTION
				RETURN 1	
			END
END
GO
DECLARE @RETORNO INT
EXEC @RETORNO = SP_ModificarAdministrador pruebaAdminMOD,pruebaAdminMOD,pass1,123456789,uadminn1,pruebaadminMOD
PRINT @retorno
go
--Creo sp para casas
CREATE PROCEDURE SP_AgregarCasa
@RutN BIGINT,
@IdEspeN INT,
@NombreN VARCHAR (20)
AS
BEGIN
	IF EXISTS (SELECT C.Rut FROM Casa C WHERE C.Rut=@RutN)
		BEGIN
			RETURN -1
		END
	ELSE
		BEGIN TRANSACTION

			INSERT INTO Casa (Rut,IdEspe,Nombre)
			VALUES (@RutN,@IdEspeN,@NombreN)

			IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRANSACTION
						RETURN @@ERROR
					END
				ELSE 
					BEGIN
						COMMIT TRANSACTION
						RETURN 1
					END
END
go
DECLARE @RETORNO INT
EXEC @RETORNO = SP_AgregarCasa 12345,1,pruebaparri
PRINT @retorno
GO
--insert Especializaciones Basicos
INSERT INTO Especializacion VALUES('Pizzeria')
INSERT INTO Especializacion VALUES('Parrillada')
INSERT INTO Especializacion VALUES('Minutas')
INSERT INTO Especializacion VALUES('Internacional')
INSERT INTO Especializacion VALUES('Vegetariano')
go


CREATE PROCEDURE SP_ModificarCasa
@RutM BIGINT,
@IdEspeM INT,
@NombreM VARCHAR (20)
AS
BEGIN
	IF NOT EXISTS (SELECT C.Rut FROM Casa C WHERE C.Rut=@RutM)
		BEGIN
			RETURN -1
		END
	ELSE
		BEGIN TRANSACTION
			UPDATE Casa
			SET Rut=@RutM,
				IdEspe=@IdEspeM,
				Nombre=@NombreM
		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
       ELSE
			BEGIN
				COMMIT TRANSACTION
				RETURN 1	
			END
END
GO
DECLARE @RETORNO INT
EXEC @RETORNO = SP_ModificarCasa 123456789,4,pruebapizzeMOD
PRINT @retorno
GO

CREATE PROCEDURE SP_BuscarCasa
@RutB BIGINT,
@IdEspe INT
AS
BEGIN
	IF NOT EXISTS (SELECT C.Rut FROM Casa C WHERE C.Rut=@RutB)
		BEGIN
			RETURN -1
		END
	ELSE
		 SELECT C.Nombre,
			    C.Rut,
				E.Tipo
		 FROM Casa C ,Especializacion E 
		 WHERE
			  C.Rut=@RutB AND E.IdEspe=@IdEspe
END

DECLARE @RETORNO INT
EXEC @RETORNO = SP_BuscarCasa 123456789,4
PRINT @retorno
GO	
@RutB INT
AS
BEGIN
	IF EXISTS (SELECT T.Rut FROM Tienen T WHERE T.Rut =@RutB)
		BEGIN TRANSACTION

		DELETE Tienen
		WHERE Tienen.Rut = @RutB

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END
	ELSE
			BEGIN
				COMMIT TRANSACTION
				RETURN 1
			END
END
DECLARE @RETORNO INT
EXEC @RETORNO = SP_BorrarCasa 123456789
PRINT @retorno

CREATE PROCEDURE SP_ListarTodasLasCasas
AS
BEGIN
	SELECT C.Nombre,
		   C.Rut,
		   E.Tipo
    FROM Casa C JOIN Especializacion E ON C.IdEspe=E.IdEspe
END

CREATE PROCEDURE SP_ListarCasa
@RutMostrar BIGINT
AS
BEGIN
	SELECT C.Nombre,
		   C.Rut,
		   E.Tipo
    FROM Casa C JOIN Especializacion E ON C.IdEspe=E.IdEspe
	WHERE C.Rut=@RutMostrar
END

-- Listar especializaciones
CREATE PROCEDURE SP_ListarEspecializaciones
AS
BEGIN
	SELECT * FROM Especializacion;
END


DECLARE @RETORNO INT
EXEC @RETORNO = SP_ListarEspecializaciones
PRINT @retorno


select * from Usuario
select * from Cliente
select * from Administrador
select * from Especializacion 
select * from Casa 
select * from Plato 
select * from Tienen 
select * from Pedido 
select * from Compran 
select * from Realizan 
select * from Casa c join Especializacion e on c.IdEspe=e.IdEspe
go

insert into Plato VALUES(1234,'PRUEBABORRAR',123)
INSERT INTO Tienen VALUES (123456789,1234)
