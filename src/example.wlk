object garlicSea{	
	var nombre = "Garlic´s Sea";
	var equipajeImpresindible = ["Caña de pescar", "Piloto"];
	var precio = 2500;
	
	method getNombre(){
		return nombre;		
	}
	
	method getPrecio(){
		return precio
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
}

object silverSea{
	var nombre = "Silver's Sea";
	var equipajeImpresindible = ["Protector solar", "Equipo de buceo"];
	var precio = 1350;
	
	method getNombre(){
		return nombre;		
	}
	
	method getPrecio(){
		return precio
	}
	
	method EsDestinoImportante(){
		return precio > 2000;
	}
	
	method aplicarDescuento(unPorcentaje){
		precio -= precio * unPorcentaje / 100
		equipajeImpresindible.add("Certificado de descuento");
	}
	
	method esPeligroso(){
		return equipajeImpresindible.any({elemento => elemento.contains("Vacuna")})
	}	
	
	method tieneCertificadoDeDescuento(){
		return equipajeImpresindible.any({elemento => elemento == "Certificado de descuento"})
	}
}

object lastToninas{	
	var nombre = "Last Toninas";
	var equipajeImpresindible = ["Vacuna Gripal", "Vacuna B", "Necronomicon"];
	var precio = 3500;
	
	method getNombre(){
		return nombre;		
	}
	
	method getPrecio(){
		return precio
	}
	
	method EsDestinoImportante(){
		return precio > 2000;
	}
	
	method aplicarDescuento(unPorcentaje){
		precio -= precio * unPorcentaje / 100
		equipajeImpresindible.add("Certificado de descuento");
	}	
	
	method esPeligroso(){
		return equipajeImpresindible.any({elemento => elemento.contains("Vacuna")})
	}
	
	method tieneCertificadoDeDescuento(){
		return equipajeImpresindible.any({elemento => elemento == "Certificado de descuento"})
	}
}

object goodAirs{	
	var nombre = "Good Airs";
	var equipajeImpresindible = ["Cerveza", "Protector solar"];
	var precio = 1500;
	
	method getNombre(){
		return nombre;		
	}
	
	method getPrecio(){
		return precio
	}
	
	method EsDestinoImportante(){
		return precio > 2000;
	}
	
	method aplicarDescuento(unPorcentaje){
		precio -= precio * unPorcentaje / 100
		equipajeImpresindible.add("Certificado de descuento");
	}
	
	method esPeligroso(){
		return equipajeImpresindible.any({elemento => elemento.contains("Vacuna")})
	}
	
	method tieneCertificadoDeDescuento(){
		return equipajeImpresindible.any({elemento => elemento == "Certificado de descuento"})
	}
	
}

object barrileteCosmico{
	var destinos = #{goodAirs, silverSea, lastToninas, garlicSea};
	
	
	method obtenerDestinosMasImportantes(){
		return destinos.filter({destino => destino.EsDestinoImportante()})
	}
	
	method aplicarDescuentos(unPorcentaje){
		destinos.forEach({destino => destino.aplicarDescuento(unPorcentaje)});			
	}
	
	method esExtrema(){
		return destinos.any({destino => destino.esPeligroso()});
	}
	
	method cartaDeDestinos(){
		return destinos.map({destino => destino.getNombre()})
	}	
	
	method todosLosDestinosTienenCertificado(){
		return destinos.all({destino => destino.tieneCertificadoDeDescuento()})
	}
}

object pHari{
	var nombreCompleto = "Pablo Hari"
	var nombreDeUsuario = "PHari"
	var dineroDisponible = 1500 
	var destinosConocidos = #{lastToninas, goodAirs}
	var siguiendo = #{} //Conjunto ya que no debe aceptar repetidos
	
	method getDestinosConocidos(){
		return destinosConocidos;
	}
	
	method getDinero(){
		return dineroDisponible;
	}
	method volarA(unDestino){
		if (dineroDisponible >= unDestino.getPrecio()){
			dineroDisponible -= unDestino.getPrecio()
			destinosConocidos.add(unDestino);
		}
	}
	
	method obtenerKilometros(){
		return destinosConocidos.sum({destino => destino.getPrecio()}) * 0.1 
	}
	
	method seguirA(unUsuario){
		siguiendo.add(unUsuario)
		unUsuario.AgregarASiguiendo(self)
	}
	
	method AgregarASiguiendo(unUsuario){
		siguiendo.add(unUsuario);
	}
}
