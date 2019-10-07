class Localidad {
	var nombre;
	var equipajeImpresindible;
	var precio;
	var kilometro;
	
	constructor(unNombre, unEquipaje, unKilometro, unPrecio) {
  		nombre = unNombre
  		equipajeImpresindible = unEquipaje
  		kilometro = unKilometro
		precio = unPrecio
  	}
	
	method getNombre(){
		return nombre;		
	}
	
	method getPrecio(){
		return precio
	}
	
	method getKilometro(){
		return kilometro;	
	}
	
	method aplicarDescuento(unPorcentaje){
		precio -= precio * unPorcentaje / 100
		equipajeImpresindible.add("Certificado de descuento");
	}
	
	method EsDestinoImportante(){
		return precio > 2000;
	}
	
	method esPeligroso(){
		return equipajeImpresindible.any({elemento => elemento.contains("Vacuna")})
	}
	
	method tieneCertificadoDeDescuento(){
		return equipajeImpresindible.any({elemento => elemento == "Certificado de descuento"})
	}
	
	method distanciaA (unaLocalidad){
		return (self.getKilometro() - unaLocalidad.getKilometro()).abs();		
	}
}
