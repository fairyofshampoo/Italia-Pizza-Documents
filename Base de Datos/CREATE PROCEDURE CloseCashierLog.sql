CREATE PROCEDURE [dbo].[CloseCashierLog]
    @finalBalance DECIMAL(10, 2),
    @closingDate DATETIME,
    @employeeEmail VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @activeLogId INT;

    -- Obtener el ID del corte de caja activo
    SELECT @activeLogId = id
    FROM CashierLog
    WHERE [status] = 1;

    IF @activeLogId IS NOT NULL
    BEGIN
        -- Actualizar el corte de caja activo
        UPDATE CashierLog
        SET [status] = 0, -- Cerrar el corte de caja
            closingDate = @closingDate,
            finalBalance = @finalBalance,
            createdBy = @employeeEmail,
            ordersCashin = ISNULL((SELECT SUM(total) FROM InternalOrder WHERE [date] >= (SELECT openingDate FROM CashierLog WHERE id = @activeLogId) AND [date] <= @closingDate), 0),
            miscellaneousCashin = ISNULL((SELECT SUM(total) FROM Cashout WHERE [date] >= (SELECT openingDate FROM CashierLog WHERE id = @activeLogId) AND [date] <= @closingDate AND cashoutType = 1), 0),
            supplierOrderCashout = ISNULL((SELECT SUM(total) FROM SupplierOrder WHERE [date] >= (SELECT openingDate FROM CashierLog WHERE id = @activeLogId) AND [date] <= @closingDate), 0),
            miscellaneousCashout = ISNULL((SELECT SUM(total) FROM Cashout WHERE [date] >= (SELECT openingDate FROM CashierLog WHERE id = @activeLogId) AND [date] <= @closingDate AND cashoutType = 0), 0)
        WHERE id = @activeLogId;

        -- Insertar un nuevo registro de corte de caja activo con saldo inicial igual al balance final del corte cerrado
        INSERT INTO CashierLog (openingDate, initialBalance, [status])
        VALUES (@closingDate, @finalBalance, 1); -- Estado activo
    END
END
GO
