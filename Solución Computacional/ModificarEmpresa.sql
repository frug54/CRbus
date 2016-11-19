USE [CRbus]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ModificarEmpresa]
					@idEmpresa int, @cedJuridica varchar(50), @nombre varchar(50), @cuentaCliente varchar(50) as

Begin
SET NOCOUNT ON;
	BEGIN TRY
		UPDATE b
		SET
			b.cedJuridica=@cedJuridica,
			b.nombre=@nombre,
			b.cuentaCliente=@cuentaCliente

		FROM dbo.Empresa B
		WHERE b.idEmpresa= @idEmpresa;

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