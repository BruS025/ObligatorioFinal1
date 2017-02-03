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
	IdEspe INT PRIMARY KEY IDENTITY(1,1),
)
GO
--Creo la tabla Casa
CREATE TABLE Casa   
(
	Rut BIGINT NOT NULL PRIMARY KEY,
	IdEspe INT NOT NULL FOREIGN KEY REFERENCES Especializacion(IdEspe) ON DELETE CASCADE,
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
	IdPlato INT FOREIGN KEY REFERENCES Plato(IdPlato),
	IdLogueo INT FOREIGN KEY REFERENCES Usuario(IdLogueo),
	IdPedido INT NOT NULL PRIMARY KEY IDENTITY (1,1)
)
GO

--Creo SP Necesarios Clientes
ALTER PROCEDURE SP_AgregarCliente
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
-- -1 documento existente -2 nombrelogueo existente 

select * from Cliente
select * from Usuario
select * from Administrador

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

