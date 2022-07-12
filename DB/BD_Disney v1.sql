CREATE DATABASE [DB_disney];



/*************************************************************************************/






/* crear tabla ubicacion proveedor*/
USE [DB_disney];


/*crear tabla ubicacion proveedor*/
CREATE TABLE [UBICACION-PROVEEDOR](
[ubipro_ID] [int] IDENTITY(1,1) NOT NULL,
[ubipro_direccion] [varchar](75) NOT NULL,
[ubipro_barrio] [varchar](50) NULL,
[ubipro_localidad] [varchar](50) NOT NULL,

CONSTRAINT [PK_UBICACION-PROVEEDOR] PRIMARY KEY CLUSTERED ([ubipro_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/* crear tabla vendedor*/

CREATE TABLE [VENDEDOR](
[vend_ID] [int] IDENTITY(1,1) NOT NULL,
[vend_nombre] [varchar](50) NULL,
[vend_apellido] [varchar](25) NOT NULL,
[vend_telefono] [varchar](10) NOT NULL,
[prov_ID] [int] NULL,

CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED ([vend_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO


/*crear tabla proveeedor*/ 
CREATE TABLE [PROVEEDOR](
[prov_ID] [int] IDENTITY(1,1) NOT NULL,
[prov_nombre] [varchar](50) NULL,
[prov_telefono] [varchar](10) NOT NULL,
[ubipro_ID] [int] NULL,

CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED ([prov_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]
)
ON [PRIMARY]
GO

ALTER TABLE [PROVEEDOR] 
	WITH CHECK ADD CONSTRAINT [FK_Ubicacion_Proveedor] FOREIGN KEY([ubipro_ID])
	REFERENCES [UBICACION-PROVEEDOR] (ubipro_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [PROVEEDOR] CHECK CONSTRAINT [FK_Ubicacion_Proveedor];
GO


/* crear relacion entre proveedor y vendedor*/

ALTER TABLE [VENDEDOR] 
	WITH CHECK ADD CONSTRAINT [FK_Proveedor_Vendedor] FOREIGN KEY([prov_ID])
	REFERENCES [PROVEEDOR] (prov_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [VENDEDOR] CHECK CONSTRAINT [FK_Proveedor_Vendedor];
GO






/************************************************************************************/








/*crear tabla de categorias de productos*/
CREATE TABLE [CATEGORIA](
[categ_ID] [int] IDENTITY(1,1) NOT NULL,
[categ_nombre] [varchar](50) NULL,
CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED ([categ_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]
			)

ON [PRIMARY]
GO

/* crear tabla de productos*/
create TABLE [PRODUCTO](
[produc_ID] [int] IDENTITY(1,1) NOT NULL,
[produc_nombre] [varchar](50) NULL,
[produc_fecha_de_vencimiento] [date] NOT NULL,
[categ_ID] [int] NULL,

CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED ([produc_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/* crear realacion entre productos y categorias*/


ALTER TABLE [PRODUCTO] 
	WITH CHECK ADD CONSTRAINT [FK_Categoria_Producto] FOREIGN KEY([categ_ID])
	REFERENCES [CATEGORIA] (categ_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [PRODUCTO] CHECK CONSTRAINT [FK_Categoria_Producto];
GO

/* crear tabla proveedor suministra productos*/
CREATE TABLE [SUMINISTRA](
	[produc_ID] [int]  NOT NULL, 
	[prov_ID] [int]  NOT NULL,
) 
ON [PRIMARY]
GO

/*crear relacion entre tabla suministra y producto*/
ALTER TABLE [SUMINISTRA] 
	WITH CHECK ADD CONSTRAINT [FK_Suministra_producto] FOREIGN KEY ([produc_ID])
	REFERENCES [PRODUCTO] (produc_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [SUMINISTRA] CHECK CONSTRAINT [FK_Suministra_producto]
GO

/*crear relacion entre tabla suministra y proveedor*/
ALTER TABLE [SUMINISTRA] 
	ADD CONSTRAINT [FK_Proveedor_Suministra] FOREIGN KEY ([prov_ID])
	REFERENCES [PROVEEDOR] (prov_ID) ON DELETE CASCADE ON UPDATE CASCADE
GO


ALTER TABLE [SUMINISTRA] CHECK CONSTRAINT [FK_Proveedor_Suministra]
GO





/**************************************************************************************/




/* crear tabla empleado*/
create TABLE [EMPLEADO](
[empl_ID] [int] IDENTITY(1,1) NOT NULL,
[empl_nombre] [varchar](50) NULL,
[empl_apellido] [varchar](25) NOT NULL,
[empl_telefono] [varchar](10) NOT NULL,
[ubiempl_ID] [int] NULL,
[cargo_ID][int] NULL,
[estado_ID] [int] NULL,

CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED ([empl_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ,
					CONSTRAINT [FK_Estado_Cliente] FOREIGN KEY([estado_ID])
		REFERENCES [ESTADO-EMPLEADO] (estado_ID) ON DELETE CASCADE ON UPDATE CASCADE,
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/*estado del empleado*/


CREATE TABLE [ESTADO-EMPLEADO](
[estado_ID] [int] IDENTITY(1,1) NOT NULL,
[estado_nombre] [varchar](50) NOT NULL,


CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED ([estado_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO
/*crear tabla cargo*/
CREATE TABLE [CARGO](
[cargo_ID] [int] IDENTITY(1,1) NOT NULL,
[cargo_nombre] [varchar](50) NULL,
[cargo_sueldo] [varchar](10) NOT NULL,


CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED ([cargo_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/*crear trabla ubicacion empleado*/
CREATE TABLE [UBICACION-EMPLEADO](
[ubiempl_ID] [int] IDENTITY(1,1) NOT NULL,
[ubiempl_direccion] [varchar](75) NOT NULL,
[ubiempl_barrio] [varchar](50) NULL,
[ubiempl_localidad] [varchar](50) NOT NULL,

CONSTRAINT [PK_UBICACION-EMPLEADO] PRIMARY KEY CLUSTERED ([ubiempl_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/*crear relacion entre cargo y empleado*/

ALTER TABLE [EMPLEADO] 
	WITH CHECK ADD CONSTRAINT [FK_Empleado_Cargo] FOREIGN KEY([cargo_ID])
	REFERENCES [CARGO] (cargo_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [EMPLEADO] CHECK CONSTRAINT [FK_Empleado_Cargo];
GO

/*crear relacion entre ubicacion y empleado*/

ALTER TABLE [EMPLEADO] 
	WITH CHECK ADD CONSTRAINT [FK_Empleado_Ubicacion] FOREIGN KEY([ubiempl_ID])
	REFERENCES [UBICACION-EMPLEADO] (ubiempl_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [EMPLEADO] CHECK CONSTRAINT [FK_Empleado_Ubicacion];
GO

/* crear tabla sede*/
create TABLE [SEDE](
[sede_ID] [int] IDENTITY(1,1) NOT NULL,
[sede_nombre] [varchar](50) NULL,
[empl_telefono] [varchar](10) NOT NULL,
[ubisede_ID] [int] NULL,
[Gerente_ID][int] NULL

CONSTRAINT [PK_Sede] PRIMARY KEY CLUSTERED ([sede_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/* crear tabla de ubicacion sede*/
CREATE TABLE [UBICACION-SEDE](
[ubisede_ID] [int] IDENTITY(1,1) NOT NULL,
[ubisede_direccion] [varchar](75) NOT NULL,
[ubisede_barrio] [varchar](50) NULL,
[ubisede_localidad] [varchar](50) NOT NULL,

CONSTRAINT [PK_UBICACION-SEDE] PRIMARY KEY CLUSTERED ([ubisede_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/*crear relacion ubicacion con la sede*/

ALTER TABLE [SEDE] 
	WITH CHECK ADD CONSTRAINT [FK_Ubicacion_Sede] FOREIGN KEY([ubisede_ID])
	REFERENCES [UBICACION-SEDE](ubisede_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [SEDE] CHECK CONSTRAINT [FK_Ubicacion_Sede]
GO

/*crear relacion gerente*/

ALTER TABLE [SEDE] 
	WITH CHECK ADD CONSTRAINT [FK_Gerente_Sede] FOREIGN KEY([Gerente_ID])
	REFERENCES [EMPLEADO] (empl_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [SEDE] CHECK CONSTRAINT [FK_Gerente_Sede];
GO


/* crear tabla Vende*/
CREATE TABLE [TRABAJA](
[empl_ID] [int] NULL,
[sede_ID][int] NULL

)
ON [PRIMARY]
GO

/* crear relacion entre trabaja y sede */
ALTER TABLE [TRABAJA] 
	ADD CONSTRAINT [FK_Sede_Trabaja] FOREIGN KEY ([sede_ID])
	REFERENCES [SEDE] (sede_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [TRABAJA] CHECK CONSTRAINT [FK_Sede_Trabaja]
GO

/* crear relacion entre empleado y trabaja*/
ALTER TABLE [TRABAJA] 
	ADD CONSTRAINT [FK_Empleado_Trabaja] FOREIGN KEY ([empl_ID])
	REFERENCES [EMPLEADO] (empl_ID) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [TRABAJA] CHECK CONSTRAINT [FK_Empleado_Trabaja]
GO






/**************************************************************************************/



/* crear tabla Vende*/
CREATE TABLE [VENDE](
[vende_precio_compra] [money] NOT NULL,
[vende_precio_por_mayor] as [vende_precio_compra] *1.20,
[vende_precio_por_menor] as [vende_precio_compra] *1.25,
[produc_ID] [int] NULL,
[sede_ID][int] NULL

)
ON [PRIMARY]
GO

/* crear relacion entre sede y vende */
ALTER TABLE [VENDE] 
	ADD CONSTRAINT [FK_Sede_Vende] FOREIGN KEY ([sede_ID])
	REFERENCES [SEDE] (sede_ID) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [VENDE] CHECK CONSTRAINT [FK_Sede_Vende]
GO

/* crear relacion entre  vende y producto */
ALTER TABLE [VENDE] 
	ADD CONSTRAINT [FK_Vende_Producto] FOREIGN KEY ([produc_ID])
	REFERENCES [PRODUCTO] (produc_ID) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [VENDE] CHECK CONSTRAINT [FK_Vende_Producto]
GO


/* crear tabla tiene cliente*/
CREATE TABLE [TIENTE-CLIENTE](
[clie_ID] [int] NULL,
[sede_ID] [int] NULL

)
ON [PRIMARY]
GO

/* crear relacion entre sede y tiene cliente*/
ALTER TABLE [TIENTE-CLIENTE] 
	WITH CHECK ADD CONSTRAINT [FK_Tiene_Cliente] FOREIGN KEY([clie_ID])
	REFERENCES [CLIENTE] (clie_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [TIENTE-CLIENTE] CHECK CONSTRAINT [FK_Tiene_Cliente];
GO

/* crear relacion entre cliente y tiene cliente*/
ALTER TABLE [TIENTE-CLIENTE] 
	WITH CHECK ADD CONSTRAINT [FK_Sede_Tiene] FOREIGN KEY([sede_ID])
	REFERENCES [SEDE] (sede_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [TIENTE-CLIENTE] CHECK CONSTRAINT [FK_Sede_Tiene];
GO





/**************************************************************************************/





/* craer tabla pedido*/
CREATE TABLE [PEDIDO](
[pedid_ID] [int] IDENTITY(1,1) NOT NULL,
[clie_ID] [int] NULL,
[fecha_pedido] [date] NOT NULL

CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED ([pedid_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]
)
ON [PRIMARY]
GO

/* crear relacion entre pedido y cliente*/

ALTER TABLE [PEDIDO]
	WITH CHECK ADD CONSTRAINT [FK_Pedido_Cliente] FOREIGN KEY([clie_ID])
	REFERENCES [CLIENTE] (clie_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [PEDIDO] CHECK CONSTRAINT [FK_Pedido_Cliente];
GO


/* craer tabla recibe*/
CREATE TABLE [RECIBE](
[pedid_ID] [int] NULL,
[empl_ID] [int] NULL,

)
ON [PRIMARY]
GO


/* crear relacion entre empleado y recibe*/

ALTER TABLE [RECIBE]
	WITH CHECK ADD CONSTRAINT [FK_Empleado_Recibe] FOREIGN KEY([empl_ID])
	REFERENCES [EMPLEADO] (empl_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [RECIBE] CHECK CONSTRAINT [FK_Empleado_Recibe];
GO

/* crear relacion entre recibe y pedido*/

ALTER TABLE [RECIBE]
	WITH CHECK ADD CONSTRAINT [FK_Recibe_Pedido] FOREIGN KEY([pedid_ID])
	REFERENCES [PEDIDO] (pedid_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [RECIBE] CHECK CONSTRAINT [FK_Recibe_Pedido];
GO






/**************************************************************************************/







/* crear tabla pedido con productos*/
CREATE TABLE [PEDIDO-CON-PRODUCTOS](
[pedid_ID] [int] NULL,
[produc_ID] [int] NULL,
[cantidad] [int] NOT NULL,

)
ON [PRIMARY]
GO

/* crear relacion entre pedido con y pedido*/

ALTER TABLE [PEDIDO-CON-PRODUCTOS]
	WITH CHECK ADD CONSTRAINT [FK_pedi_productos_Pedido] FOREIGN KEY([pedid_ID])
	REFERENCES [PEDIDO] (pedid_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [PEDIDO-CON-PRODUCTOS] CHECK CONSTRAINT [FK_pedi_productos_Pedido];
GO

/* crear relacion entre pedido con y producto*/

ALTER TABLE [PEDIDO-CON-PRODUCTOS]
	WITH CHECK ADD CONSTRAINT [FK_pedi_productos_Producto] FOREIGN KEY([produc_ID])
	REFERENCES [PRODUCTO] (produc_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [PEDIDO-CON-PRODUCTOS] CHECK CONSTRAINT [FK_pedi_productos_Producto];
GO

/*crear tabla factura*/
CREATE TABLE [FACTURA](
[factu_ID] [int] IDENTITY(1,1) NOT NULL,
[factu_fecha] [date] NOT NULL,
[factu_descuento] [int] NULL,
[empl_Id] [int] null,
[pedid_Id] [int] null,

CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED ([factu_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

/* crear realacion entre facutra y empleado*/
ALTER TABLE [FACTURA]
	WITH CHECK ADD CONSTRAINT [FK_Factura_empleado] FOREIGN KEY([empl_ID])
	REFERENCES [EMPLEADO] (empl_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [FACTURA] CHECK CONSTRAINT [FK_Factura_empleado];
GO

/* crear realacion entre facutra y pedido*/
ALTER TABLE [FACTURA]
	WITH CHECK ADD CONSTRAINT [FK_Factura_pedido] FOREIGN KEY([pedid_ID])
	REFERENCES [PEDIDO] (pedid_ID) ON DELETE CASCADE ON UPDATE CASCADE;
GO

ALTER TABLE [FACTURA] CHECK CONSTRAINT [FK_Factura_pedido];
GO