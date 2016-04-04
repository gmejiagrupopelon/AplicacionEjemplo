CREATE TABLE [dbo].[T_Personas](
	[Cedula] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](200) NOT NULL,
	[Telefono] [varchar](9) NULL,
	[Direccion] [varchar](400) NULL
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO DBO.T_Personas(Cedula,Nombre,Apellidos,Telefono,Direccion)
VALUES('1-1234-1123','Pedro','Perez Soto','8888-4444','Santa Ana, De la Iglesia Católica 50mts norte 425mts este')
INSERT INTO DBO.T_Personas(Cedula,Nombre,Apellidos,Telefono,Direccion)
VALUES('1-1234-1113','Juan','Perez Sosa','8888-4432','Belén, De la Iglesia Católica 50mts norte 430mts este')
INSERT INTO DBO.T_Personas(Cedula,Nombre,Apellidos,Telefono,Direccion)
VALUES('1-1234-1135','Lucas','Perez López','8392-1144','Puriscal, De la Iglesia Católica 50mts norte 440mts este')
INSERT INTO DBO.T_Personas(Cedula,Nombre,Apellidos,Telefono,Direccion)
VALUES('1-1234-4123','María','López Soto','8704-4434','Lindora, De la Iglesia Católica 50mts norte 500mts este')
INSERT INTO DBO.T_Personas(Cedula,Nombre,Apellidos,Telefono,Direccion)
VALUES('1-1264-1123','Rosa','Sanabria Esquivel','8288-4114','Cariari, De la Iglesia Católica 50mts norte 600mts este')
INSERT INTO DBO.T_Personas(Cedula,Nombre,Apellidos,Telefono,Direccion)
VALUES('1-1734-1123','Susana','Guzman Alemán','8838-1313','Pozos, De la Iglesia Católica 100mts norte 200mts este')

