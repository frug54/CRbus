USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[InsertarDireccion]
					@detalle varchar(50), @fkCanton int, @fkDistrito int, @fkProvincia int as

Begin
	begin try
		Begin Transaction
		--
			insert into dbo.Direccion(detalle, fkCanton, fkDistrito, fkProvincia)
			values (@detalle, @fkCanton, @fkDistrito, @fkProvincia)


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