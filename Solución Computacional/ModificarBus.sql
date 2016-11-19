USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ModificarBus]
					@idBus int, @placa varchar(50), @año date, @modelo varchar(50),
						@capacidadAciento int, @capacidadDePie int, @fkCompañia int, @fkChofer int as

Begin
SET NOCOUNT ON;
	BEGIN TRY
		UPDATE b
		SET
			b.placa=@placa,
			b.modelo=@modelo,
			b.ano=@ano,
			b.capacidadAciento=@capacidadAciento,
			b.capacidadDePie=@capacidadDePie,
			b.fkCompañia=@fkCompañia,
			b.fkChofer=@fkChofer

		FROM dbo.Bus B
		WHERE b.idBus= @idBus;

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
		end
	END CATCH
end