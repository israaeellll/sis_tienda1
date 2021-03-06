<?php
/**
*@package pXP
*@file gen-ACTProducto.php
*@author  (admin)
*@date 02-03-2015 15:16:05
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTProducto extends ACTbase{    
			
	function listarProducto(){
		$this->objParam->defecto('ordenacion','id_producto');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		/*
		 * cuando se selecciona una categoria se manda id_categoria
		 * y se recibe en este metodo
		 */
		if($this->objParam->getParametro('id_categoria')!=''){
	    	$this->objParam->addFiltro("pro.id_categoria = ".$this->objParam->getParametro('id_categoria'));	
		}
		
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODProducto','listarProducto');
		} else{
			$this->objFunc=$this->create('MODProducto');
			
			$this->res=$this->objFunc->listarProducto($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarProducto(){
		$this->objFunc=$this->create('MODProducto');	
		if($this->objParam->insertar('id_producto')){
			$this->res=$this->objFunc->insertarProducto($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarProducto($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarProducto(){
			$this->objFunc=$this->create('MODProducto');	
		$this->res=$this->objFunc->eliminarProducto($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>