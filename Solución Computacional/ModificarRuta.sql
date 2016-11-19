USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ModificarRuta]
					@idRuta int, @nombre varchar(50), @tarifa int, @fkEmpresa int as

Begin
SET NOCOUNT ON;
	BEGIN TRY
		UPDATE b
		SET
			b.nombre=@nombre,
			b.tarifa=@tarifa,
			b.activo=@activo,
			b.fkEmpresa=@fkEmpresa

		FROM dbo.Ruta B
		WHERE b.idRuta= @idRuta;

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