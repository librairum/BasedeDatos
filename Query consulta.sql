use LionsVentas
go

	alter procedure RestablecerIdIdentity(@tabla varchar(200), @valorIdentity int)
	as
	Begin
	--DBCC checkident ('marca')
	--DBCC checkident ('Employees', reseed)
	--exec RestablecerIdIdentity 'marca', 5
		DBCC checkident (@tabla, reseed, @valorIdentity)
	End
	 
set ansi_warnings off -- off permite que se ingrese un valor mayor a la capacidad de la columna
-- el procedimiento recorta la cadena al limite definido en el campo y no indica mensaje de error
insert into MARCA values('asdjklnaskjdaksljdbalsbdkljazzzzzzzzzzzzzzzzzzzzzzzzzzjddddddd', 'A')

set ansi_warnings on -- on permite solo ingresar un valor segun la capacidad de la columna, trunca la insercion
--y muestra un mensaje de error del motivo de insertar
insert into MARCA values('asdjklnaskjdaksljdbalsbdkljazzzzzzzzzzzzzzzzzzzzzzzzzzjddddddd', 'A')

--en un procedimiento almacenado que esta definido por el usuario, la responsabilidad esta por parte del usuario
-- el usuario no debe permitir a los parametors que ingrese
