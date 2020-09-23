CREATE TABLE Materiales
(
    Clave numeric(5) not null,
    Descripcion varchar(50),
    Costo numeric(8,2)
);

CREATE TABLE Proveedores
(
    RFC char(13) not null,
    RazonSocial varchar(50)
);

CREATE TABLE Proyectos
(
    Numero numeric(5) not null,
    Denominacion varchar(50)
);

CREATE TABLE Entregan
(
    Clave numeric(5) not null,
    RFC char(13) not null,
    Numero numeric(5) not null,
    Fecha DateTime not null,
    Cantidad numeric(8,2)
);
