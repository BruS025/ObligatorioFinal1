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
--Creo la tabla Cargo
CREATE TABLE Cargo
(
	Tipo VARCHAR(20) NOT NULL,
	IdCargo INT PRIMARY KEY IDENTITY(1,1)
)
GO
--Creo la tabla Administrador
CREATE TABLE Administrador
(
	IdLogueo INT PRIMARY KEY FOREIGN KEY REFERENCES Usuario(IdLogueo) ON DELETE CASCADE,
	IdCargo INT FOREIGN KEY REFERENCES Cargo(IdCargo)
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
	IdPlato INT PRIMARY KEY IDENTITY NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Precio INT NOT NULL,
    Foto VARCHAR(MAX)
)
GO
--Creo la tabla Tienen
CREATE TABLE Tienen
(
	Rut BIGINT FOREIGN KEY REFERENCES Casa(Rut) ON DELETE CASCADE,
	IdPlato INT FOREIGN KEY REFERENCES Plato(IdPlato) ON DELETE CASCADE UNIQUE,
	IdPlatoCasa INT NOT NULL,
	PRIMARY KEY(Rut,IdPlato)
)
GO

--Creo la tabla Pedido
CREATE TABLE Pedido
(
	IdPedido INT PRIMARY KEY NOT NULL,
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
	IdPedido INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Cantidad INT NOT NULL
)
GO
------------------------
--SP Necesarios Clientes
------------------------
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
-- -1 documento existente -2 nombrelogueo existente 

-------------------------------
--SP Necesarios administradores
-------------------------------
CREATE PROCEDURE SP_AgregarAdministrador
@NombreN VARCHAR(20) ,
@ApellidoN VARCHAR (20),
@ContraseniaN VARCHAR(20),
@NroDocN INT,
@NombreLogueoN VARCHAR(20),
@CargoN INT
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

			INSERT INTO Administrador (IdLogueo,IdCargo)
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
CREATE PROCEDURE SP_ModificarAdministrador
@NombreM VARCHAR(20),
@ApellidoM VARCHAR (20),
@ContraseniaM VARCHAR(20),
@NroDocM INT,
@NombreLogueoM VARCHAR(20),
@CargoM INT
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
				IdCargo=@CargoM
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
CREATE PROCEDURE SP_BorrarAdministrador
@NroDocB INT
AS
BEGIN
	BEGIN TRANSACTION 
		DELETE Usuario
		WHERE IdLogueo = (SELECT U.IdLogueo FROM Usuario U WHERE U.NroDoc=@NroDocB)

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
ALTER PROCEDURE SP_ListarAdministradores
@IdCargoB INT
AS
BEGIN
	SELECT DISTINCT U.Nombre,
		   U.Apellido,
		   U.NroDoc
    FROM Usuario U join Administrador A on U.IdLogueo=A.IdLogueo
	WHERE A.IdCargo=@IdCargoB
END
GO


	--documento usuario nombre y apellido
-- -1 documento existente -2 nombrelogueo existente 

---------------------
--SP Necesarios para Casas
--------------------

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
GO
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
				WHERE casa.Rut = @RutM
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
GO	
CREATE PROCEDURE SP_BorrarCasa
@RutB BIGINT
AS
BEGIN
		BEGIN TRANSACTION

		DELETE Plato
		WHERE Plato.IdPlato IN (SELECT t.IdPlato FROM Tienen t WHERE t.Rut=@RutB)

		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRANSACTION
				RETURN @@ERROR
			END

		DELETE Casa
		WHERE Casa.Rut = @RutB

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

----------------------------
--SP Necesarios para Platos
----------------------------
CREATE PROCEDURE SP_AgregarPlato
@Rut BIGINT,
@NombreA VARCHAR(20),
@PrecioA FLOAT,
@FotoA VARCHAR(MAX)
AS
BEGIN
	IF EXISTS(SELECT Tienen.Rut FROM Tienen WHERE Tienen.Rut=@Rut)
	BEGIN
		BEGIN TRANSACTION
		     INSERT INTO Plato (Nombre,Precio,Foto)
			        VALUES (@NombreA,@PrecioA,@FotoA)

			IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRANSACTION
						RETURN @@ERROR
					END

			     INSERT INTO Tienen (Rut,IdPlato,IdPlatoCasa)
			     VALUES (@Rut,(SELECT max(Plato.IdPlato) FROM Plato),(SELECT max(Tienen.IdPlatoCasa) +1 FROM Tienen WHERE Tienen.Rut=@Rut))

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
	ELSE
		BEGIN
		     BEGIN TRANSACTION
		     INSERT INTO Plato (Nombre,Precio,Foto)
			        VALUES (@NombreA,@PrecioA,@FotoA)

			IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRANSACTION
						RETURN @@ERROR
					END

		     INSERT INTO Tienen (Rut,IdPlato,IdPlatoCasa)
			        VALUES (@Rut,(SELECT max(Plato.IdPlato) FROM Plato),1)

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
END
GO
CREATE PROCEDURE SP_ModificarPlato
@RutOriginal BIGINT,
@NombreM VARCHAR(20),
@PrecioM FLOAT,
@FotoM VARCHAR(MAX)
AS
BEGIN
 IF EXISTS(SELECT T.IdPlatoCasa FROM Tienen T WHERE Rut=@RutOriginal)
	BEGIN
		BEGIN TRANSACTION
			UPDATE Plato
			SET Nombre=@NombreM,
				Precio=@PrecioM,
				Foto=@FotoM
			WHERE Plato.IdPlato IN (SELECT T.IdPlato FROM Tienen T WHERE Rut=@RutOriginal)
		
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
ELSE 
	BEGIN
		RETURN -1
	END
END
GO
CREATE PROCEDURE SP_BorrarPlato
@IdPlatoB INT,
@Rut BIGINT
AS
BEGIN
	BEGIN TRANSACTION
		DELETE Plato WHERE Plato.IdPlato = (SELECT pl.IdPlato FROM Casa ca
											JOIN Tienen ti on Ca.Rut = ti.Rut
											JOIN Plato pl on ti.IdPlato = pl.IdPlato
											WHERE ti.IdPlatoCasa = @IdPlatoB and ti.Rut = @Rut)

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

---------------------------
--SP Necesarios para Pedido
---------------------------
CREATE PROCEDURE SP_ListarTodasLasCasas
AS
BEGIN
	SELECT C.Nombre,
		   C.Rut, 
		   C.IdEspe
    FROM Casa C JOIN Especializacion E ON C.IdEspe=E.IdEspe
END
GO

CREATE PROCEDURE SP_ListarCasa
@IdEspeMostrar INT
AS
BEGIN
	SELECT C.Nombre,
		   C.Rut,
		   C.IdEspe
    FROM Casa C JOIN Especializacion E ON C.IdEspe=E.IdEspe
	WHERE E.IdEspe=@IdEspeMostrar
END
GO

-- Listar especializaciones
CREATE PROCEDURE SP_ListarEspecializaciones
AS
BEGIN
	SELECT * FROM Especializacion;
END
GO

-- Listar cargos
CREATE PROCEDURE SP_ListarCargos
AS
BEGIN
	SELECT * FROM Cargo;
END
GO

-- Casas pedidos
-- Recibe: idEspe - RUT
-- Envia: RUT - idPlatoCasa - Nombre - Plato - Precio
CREATE PROCEDURE ListarPlatoPedido
@IdEspe INT,
@Rut BIGINT
AS
BEGIN
	SELECT pl.IdPlato, pl.Nombre, pl.Precio, pl.Foto FROM Plato pl
	JOIN Tienen ti on pl.IdPlato = ti.IdPlato 
	JOIN Casa ca on ca.Rut = ti.Rut
	JOIN Especializacion esp on esp.IdEspe = ca.IdEspe
	WHERE esp.IdEspe = @IdEspe and ca.Rut = @Rut
 END
 GO

 -- Listado de casas para el pedido
 CREATE PROCEDURE ListarCasaPedido
@IdEspe INT
AS
BEGIN
	SELECT * FROM Casa ca WHERE ca.IdEspe = @IdEspe
 END
 GO

-- Listado de platos para casa
 CREATE PROCEDURE ListarPlato
@rut BIGINT
AS
BEGIN
	SELECT ti.IdPlatoCasa, pl.Nombre, pl.Precio, pl.Foto FROM Plato pl
	JOIN Tienen ti on pl.IdPlato = ti.IdPlato 
	JOIN Casa ca on ca.Rut = ti.Rut
	JOIN Especializacion esp on esp.IdEspe = ca.IdEspe
	WHERE ca.Rut = @Rut

 END
 GO

------------------
-- DATOS DE AMBIENTE
--Especializaciones Basicos
INSERT INTO Especializacion VALUES('Pizzeria')
INSERT INTO Especializacion VALUES('Parrillada')
INSERT INTO Especializacion VALUES('Minutas')
INSERT INTO Especializacion VALUES('Internacional')
INSERT INTO Especializacion VALUES('Vegetariano')

-- Cargos Basicos
INSERT INTO Cargo VALUES ('ADMIN')
INSERT INTO Cargo VALUES ('GERENTE')


-- DATOS DE PRUEBA
INSERT INTO Casa VALUES(1234567890123452,1,'CASAPrimera')
INSERT INTO Casa VALUES(1234567890123456,2,'CASA1')
INSERT INTO Casa VALUES(1234567890123455,3,'CASA2')
INSERT INTO Casa VALUES(1234567890123454,4,'CASA3')
INSERT INTO Casa VALUES(1234567890123453,5,'CASA4')

INSERT INTO Plato VALUES('PLATO1',1,'FOTO1')
INSERT INTO Plato VALUES('PLATO2',2,'FOTO2')
INSERT INTO Plato VALUES('PLATO3',3,'FOTO3')
INSERT INTO Plato VALUES('PLATO4',4,'FOTO4')
INSERT INTO Plato VALUES('PLATO5',5,'FOTO5')

INSERT INTO Tienen VALUES(1234567890123452,1,1)
INSERT INTO Tienen VALUES(1234567890123456,2,2)
INSERT INTO Tienen VALUES(1234567890123455,3,3)
INSERT INTO Tienen VALUES(1234567890123454,4,4)
INSERT INTO Tienen VALUES(1234567890123453,5,5)

/*
-- Consultas basicas
delete Plato
SELECT * FROM Cargo
select * from Usuario
select * from Administrador
select * from Cliente
select * from Especializacion 
select * from Casa 
select * from Plato 
select * from Tienen 
select * from Pedido 
select * from Compran 
select * from Realizan 
select * from Casa c join Especializacion e on c.IdEspe=e.IdEspe
DELETE Especializacion

-- TEST SP
  

DECLARE @RETORNO INT
EXEC @RETORNO = SP_AgregarAdministrador 'prueba3','prueba3','pass3',123457,'log3',2
PRINT @retorno

=======
EXEC @RETORNO = ListarPlato 1,1234567890123456
PRINT @retorno




INSERT INTO CASA (rut,IdEspe,Nombre) values (1234123412341234,1,'Comida')
INSERT INTO CASA (rut,IdEspe,Nombre) values (1234123412341231,1,'Comida2')

DECLARE @RETORNO INT
EXEC @RETORNO = ListarPlato 1,1234567890123452
PRINT @retorno*/
/*
@Rut INT,
@NombreA VARCHAR(20),
@PrecioA FLOAT,
@FotoA VARCHAR(MAX)

DECLARE @RETORNO INT
EXEC @RETORNO = AgreSP_AgregarPlato 1,1234567890123452
PRINT @retorno*/