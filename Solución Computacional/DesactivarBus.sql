USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[DesactivarBus]
				@idBus int as
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE u
		SET
			u.activo=0

		FROM dbo.Bus U
		WHERE u.idBus = @idBus;
		commit
	END TRY
	begin catch
	SELECT
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
		if @@TRANCOUNT>0
		BEGIN
			ROLLBACK;
			RETURN -50001
		END
	end catch
END

