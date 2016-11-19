USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[InsertarParadaPorRuta]
					@fkRuta int, @fkParada int as

Begin
	begin try
		Begin Transaction
		--
			insert into dbo.ParadaPorRuta(fkRuta, fkParada)
			values (@fkRuta, @fkParada)


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