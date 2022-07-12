
CREATE TABLE [UBICACION-CLIENTE](
[ubiclie_ID] [int] IDENTITY(1,1) NOT NULL,
[ubiclie_direccion] [varchar](75) NULL,
[ubiclie_barrio] [varchar](50) NULL,
[ubiclie_localidad] [varchar](50) NOT NULL,

CONSTRAINT [PK_UBICACION-CLIENTE] PRIMARY KEY CLUSTERED ([ubiclie_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

CREATE TABLE [TIPO-CLIENTE](

[tipoclie_ID] [int] IDENTITY(1,1) NOT NULL,
[tipoclie_tipo] [varchar](25) NOT NULL,

CONSTRAINT [PK_Tipo_Cliente] PRIMARY KEY CLUSTERED ([tipoclie_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]
)
ON [PRIMARY]
GO

CREATE TABLE [ADMINISTRADOR-CLIENTE](
[admiClie_ID] [int] IDENTITY(1,1) NOT NULL,
[admiClie_primer_nombre] [varchar](50) NOT NULL,
[admiClie_segundo_nombre] [varchar](50) NULL,
[admiClie_apellidos] [varchar](50) NULL,
[admiClie_Cedula] [varchar](20) NULL,
[admiClie_telefono] [varchar](13) NOT NULL,

CONSTRAINT [PK_Admin_clienteTa] PRIMARY KEY CLUSTERED ([admiClie_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

CREATE TABLE [ESTADO-CLIENTE](
[estadocli_ID] [int] IDENTITY(1,1) NOT NULL,
[estadocli_nombre] [varchar](50) NOT NULL,

CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED ([estadocli_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

CREATE TABLE [DUEÑO-CLIENTE](
[dueñoClie_ID] [int] IDENTITY(1,1) NOT NULL,
[dueñoClie_primer_nombre] [varchar](50) NULL,
[dueñoClie_segundo_nombre] [varchar](50) NULL,
[dueñoClie_apellidos] [varchar](50) NULL,
[dueñoClie_cedula] [varchar](20) NOT NULL,
[dueñoClie_telefono] [varchar](13) NOT NULL,

CONSTRAINT [PK_DUEÑO_clienteTa] PRIMARY KEY CLUSTERED ([dueñoClie_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY]

)
ON [PRIMARY]
GO

CREATE TABLE [CLIENTE](
[clie_ID] [int] IDENTITY(1,1) NOT NULL,
[clie_nombre] [varchar](50) NULL,
[clie_NIT] [varchar](25) NOT NULL,
[clie_telefono] [varchar](10) NOT NULL,
[fecha_creacion] [data] NOT NULL,
[ubiclie_ID] [int] NULL,
[admiClie_ID] [int] NULL,
[tipoclie_ID] [int] NULL,
[estadocli_ID] [int] NULL,


CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED ([clie_ID] ASC)
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
                ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
                ON [PRIMARY],

		CONSTRAINT [FK_Ubicacion_Cliente] FOREIGN KEY([ubiclie_ID])
		REFERENCES [UBICACION-CLIENTE] (ubiclie_ID) ON DELETE CASCADE ON UPDATE CASCADE,

		 CONSTRAINT [FK_Tipo_Cliente] FOREIGN KEY([tipoclie_ID])
		REFERENCES [TIPO-CLIENTE] (tipoclie_ID) ON DELETE CASCADE ON UPDATE CASCADE,

		CONSTRAINT [FK_Admin_Cliente] FOREIGN KEY([admiClie_ID])
		REFERENCES [ADMINISTRADOR-CLIENTE] (admiClie_ID) ON DELETE CASCADE ON UPDATE CASCADE,		

		CONSTRAINT [FK_Estado_Cliente] FOREIGN KEY([estadocli_ID])
		REFERENCES [ESTADO-CLIENTE] (estadocli_ID) ON DELETE CASCADE ON UPDATE CASCADE,

)
ON [PRIMARY]
GO

CREATE TABLE [POSEE](
	[clie_ID] [int] NULL,
	[dueñoClie_ID][int] NULL,

	CONSTRAINT [FK_Posee_Cliente] FOREIGN KEY([Clie_ID])
	REFERENCES [CLIENTE] (clie_ID) ON DELETE CASCADE ON UPDATE CASCADE,

	CONSTRAINT [FK_Dueño_Posee] FOREIGN KEY([dueñoClie_ID])
	REFERENCES [DUEÑO-CLIENTE] (dueñoClie_ID) ON DELETE CASCADE ON UPDATE CASCADE,
)
ON [PRIMARY]
GO



