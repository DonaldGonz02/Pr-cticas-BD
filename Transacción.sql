USE [DB_Prueba]
GO
/****** Object:  Table [dbo].[auditoria]    Script Date: 23/3/2024 21:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoria](
	[ID] [int] NOT NULL,
	[cuenta] [int] NULL,
	[monto] [decimal](10, 2) NULL,
	[tipo_movimiento] [varchar](20) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuenta]    Script Date: 23/3/2024 21:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuenta](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[balance] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tranferencia]    Script Date: 23/3/2024 21:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tranferencia](
	[id] [int] NOT NULL,
	[cuenta_origen] [int] NULL,
	[cuenta_destino] [int] NULL,
	[monto] [decimal](10, 2) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[auditoria]  WITH CHECK ADD FOREIGN KEY([cuenta])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[tranferencia]  WITH CHECK ADD FOREIGN KEY([cuenta_origen])
REFERENCES [dbo].[cuenta] ([id])
GO
ALTER TABLE [dbo].[tranferencia]  WITH CHECK ADD FOREIGN KEY([cuenta_destino])
REFERENCES [dbo].[cuenta] ([id])
GO
/****** Object:  StoredProcedure [dbo].[RegistrarVentaConTransaccion]    Script Date: 23/3/2024 21:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegistrarVentaConTransaccion]
    @ID_Libro INT,
    @Cantidad_Libro INT,
    @FechaVenta DATE
AS
BEGIN
    BEGIN TRANSACTION; -- Inicia la transacción

    DECLARE @StockActual INT;
    DECLARE @PrecioUnitario DECIMAL(10, 2);
    DECLARE @PrecioVenta DECIMAL(10, 2);

    -- Obtener el stock actual del libro
    SELECT @StockActual = Stock_Libro,
           @PrecioUnitario = PrecioUnitario_Libro
    FROM [dbo].[Libro]
    WHERE ID_Libro = @ID_Libro;

    -- Validar si hay suficiente stock
    IF @StockActual >= @Cantidad_Libro
    BEGIN
        -- Calcular el precio de venta
        IF @Cantidad_Libro > 5
        BEGIN
            SET @PrecioVenta = @PrecioUnitario * @Cantidad_Libro * 0.9; -- Aplicar 10% de descuento
        END
        ELSE
        BEGIN
            SET @PrecioVenta = @PrecioUnitario * @Cantidad_Libro;
        END

       -- Actualizar el stock en la tabla [dbo].[Libro]
        UPDATE [dbo].[Libro]
        SET Stock_Libro = Stock_Libro - @Cantidad_Libro
        WHERE ID_Libro = @ID_Libro;

        PRINT 'Venta registrada correctamente. Precio de venta: ' + CONVERT(VARCHAR, @PrecioVenta);

        COMMIT; -- Confirma la transacción
    END
    ELSE
    BEGIN
        -- Abortar la transacción y notificar al usuario
        PRINT 'No hay suficiente stock para realizar la venta.';
        ROLLBACK; -- Deshace la transacción
    END
END;
GO
