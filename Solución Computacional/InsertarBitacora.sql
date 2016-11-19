USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[InsertarBitacora]
					@fecha datetime, @usuario varchar(50), @descripcion varchar(50)as

Begin
	begin try
		Begin Transaction
		--
			insert into dbo.Bitacora(fecha, usuario, descripcion)
			values (@fecha, @usuario, @descripcion)


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