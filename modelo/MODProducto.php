<?php
/**
*@package pXP
*@file gen-MODProducto.php
*@author  (admin)
*@date 02-03-2015 15:16:05
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODProducto extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarProducto(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='ti.ft_producto_sel';
		$this->transaccion='TI_PRO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_producto','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_categoria','int4');
		$this->captura('descripcion','varchar');
		$this->captura('id_marca','int4');
		$this->captura('nombre','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		$this->captura('desc_categoria','varchar');
		$this->captura('desc_marca','varchar');
		$this->captura('stock','int4');
		
		
		
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarProducto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='ti.ft_producto_ime';
		$this->transaccion='TI_PRO_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_categoria','id_categoria','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_marca','id_marca','int4');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('stock','stock','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarProducto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='ti.ft_producto_ime';
		$this->transaccion='TI_PRO_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_producto','id_producto','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_categoria','id_categoria','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_marca','id_marca','int4');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('stock','stock','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarProducto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='ti.ft_producto_ime';
		$this->transaccion='TI_PRO_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_producto','id_producto','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>