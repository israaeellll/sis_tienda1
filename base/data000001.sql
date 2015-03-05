/********************************************I-DAT-IPQ-TI-0-05/03/2015********************************************/
/*
*	Author: FRH
*	Date: 15/02/2013
*	Description: Build the menu definition and the composition
*/


/*

INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('TI', 'tienda', '2015-03-05', 'TI', 'activo', 'tienda', NULL);

----------------------------------
--COPY LINES TO data.sql FILE  
---------------------------------

select pxp.f_insert_tgui ('TIENDA', '', 'TI', 'si', 1, '', 1, '', '', 'TI');
select pxp.f_insert_tgui ('marca', 'marca', 'MAR', 'si', 1, 'sis_tienda/vista/marca/Marca.php', 2, '', 'Marca', 'TI');
select pxp.f_insert_tgui ('categoria', 'categoria', 'CAT', 'si', 2, 'sis_tienda/vista/categoria/Categoria.php', 2, '', 'Categoria', 'TI');
select pxp.f_insert_tgui ('producto', 'productos', 'PROD', 'si', 3, 'sis_tienda/vista/producto/Producto.php', 2, '', 'Producto', 'TI');
select pxp.f_insert_tgui ('movimiento', 'movimientos', 'MOV', 'si', 4, 'sis_tienda/vista/movimiento/Movimiento.php', 2, '', 'Movimiento', 'TI');
----------------------------------
--COPY LINES TO dependencies.sql FILE  
---------------------------------

select pxp.f_insert_testructura_gui ('TI', 'SISTEMA');
select pxp.f_insert_testructura_gui ('MAR', 'TI');
select pxp.f_insert_testructura_gui ('CAT', 'TI');
select pxp.f_insert_testructura_gui ('PROD', 'TI');
select pxp.f_insert_testructura_gui ('MOV', 'TI');


/******************************************F-DAT-IPQ-TI-0-05/03/2015**********************************************/
