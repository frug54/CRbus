USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[InsertarUsuario]
					@saldo int, @cuentaCliente varchar(50), @fkPersona int, @fechaDeNacimiento date, 
					@fkDireccion int as

Begin
	begin try
		Begin Transaction
		--
			insert into dbo.Usuario(saldo, cuentaCliente, fkPersona, fechaDeNacimiento, 
					fkDireccion)

			values (@saldo, @cuentaCliente, @fkPersona ,@fechaDeNacimiento, 
					@fkDireccion)


		commit
		return 1
	end try
	BEGIN CATCH
		SELECT
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
		if @@TRANCOUNT>0
			ROLLBACK;
			RETURN -50001
	END CATCH
end