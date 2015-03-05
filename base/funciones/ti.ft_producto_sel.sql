/**************************************************************************
 SISTEMA:		Tienda
 FUNCION: 		ti.ft_producto_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'ti.tproducto'
 AUTOR: 		 (admin)
 FECHA:	        02-03-2015 15:16:05
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'ti.ft_producto_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'TI_PRO_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		02-03-2015 15:16:05
	***********************************/

	if(p_transaccion='TI_PRO_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						pro.id_producto,
						pro.estado_reg,
						pro.id_categoria,
						pro.descripcion,
						pro.id_marca,
						pro.nombre,
						pro.id_usuario_reg,
						pro.usuario_ai,
						pro.fecha_reg,
						pro.id_usuario_ai,
						pro.id_usuario_mod,
						pro.fecha_mod,
                        pro.stock,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
                        cate.nombre as desc_categoria,
                        marc.nombre as desc_marca
                        	
						from ti.tproducto pro
						inner join segu.tusuario usu1 on usu1.id_usuario = pro.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = pro.id_usuario_mod
                        inner join ti.tcategoria cate on cate.id_categoria = pro.id_categoria
                        inner join ti.tmarca marc on marc.id_marca = pro.id_marca
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'TI_PRO_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		02-03-2015 15:16:05
	***********************************/

	elsif(p_transaccion='TI_PRO_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_producto)
					    from ti.tproducto pro
					    inner join segu.tusuario usu1 on usu1.id_usuario = pro.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = pro.id_usuario_mod
                        inner join ti.tcategoria cate on cate.id_categoria = pro.id_categoria
                        inner join ti.tmarca marc on marc.id_marca = pro.id_marca
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
	end if;
					
EXCEPTION
					
	WHEN OTHERS THEN
			v_resp='';
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
			v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
			v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
			raise exception '%',v_resp;
END;