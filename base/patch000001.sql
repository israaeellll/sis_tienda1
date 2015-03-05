/***********************************I-SCP-IPQ-TI-0-05/03/2015****************************************/
CREATE TABLE ti.tcategoria (
  id_categoria SERIAL,
  nombre VARCHAR(150),
  CONSTRAINT pk_categoria PRIMARY KEY(id_categoria)
) INHERITS (pxp.tbase)

WITH (oids = false);

CREATE TABLE ti.tmarca (
  id_marca SERIAL,
  nombre VARCHAR(150),
  CONSTRAINT pk_marca PRIMARY KEY(id_marca)
) INHERITS (pxp.tbase)

WITH (oids = false);

CREATE TABLE ti.tmovimiento (
  id_movimiento SERIAL,
  fecha DATE,
  cantidad_movimiento INTEGER,
  tipo VARCHAR(50),
  id_producto INTEGER,
  CONSTRAINT pk_movimiento PRIMARY KEY(id_movimiento)
) INHERITS (pxp.tbase)

WITH (oids = false);

CREATE TABLE ti.tproducto (
  id_producto SERIAL,
  nombre VARCHAR(150),
  descripcion VARCHAR(150),
  id_marca INTEGER,
  id_categoria INTEGER,
  stock INTEGER,
  CONSTRAINT pk_producto PRIMARY KEY(id_producto)
) INHERITS (pxp.tbase)

WITH (oids = false); 
 
/***********************************F-SCP-IPQ-TI-0-05/03/2015****************************************/