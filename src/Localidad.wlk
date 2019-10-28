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

class Playa inherits Localidad {
	
	override method esPeligroso() = false;
}

class Montana inherits Localidad {
	var altura
	
	constructor(unNombre, unEquipaje, unKilometro, unPrecio, unaAltura) =
  		super(unNombre, unEquipaje, unKilometro, unPrecio){
  		
		altura = unaAltura
  	}
  	
  	override method esPeligroso(){
  		return super() && altura > 5000
  	}
	
	override method EsDestinoImportante() = true
}

class CiudadHistorica inherits Localidad {
	var property museos
	
	constructor(unNombre, unEquipaje, unKilometro, unPrecio, unosMuseos) =
  		super(unNombre, unEquipaje, unKilometro, unPrecio){
  		
		museos = unosMuseos
  	}
	
	override method EsDestinoImportante(){
		return super() && museos.size() >= 3
	}
	
	override method esPeligroso(){
		return !equipajeImpresindible.contains("seguro de asistencia al viajero")
	}
}

const garlicSea = new Playa("Garlic´s Sea", ["Caña de Pescar" , "Piloto"], 300, 2500)
const lastToninas = new Playa("Last Toninas", ["Vacuna Gripal" , "Vacuna B" , "Necronomicon"], 500, 3500)
const silverSea = new Playa("Silver's Sea", ["Protector Solar" , "Equipo de Buceo"], 400, 1350)
const goodAirs = new CiudadHistorica("Good Airs", ["Cerveza" , "Protector Solar"], 0, 1500, #{"MALBA", "CIENCIAS NATURALES", "MUSEO HISTORICO NACIONAL"})
const roma = new CiudadHistorica("Good Airs", ["Cerveza" , "Protector Solar", "seguro de asistencia al viajero"], 0, 2500, #{"MUSEO VATICANO", "CAPILLA SIXTINA", "MUSEOS CAPITOLINOS", "MUSEO DE ROMA"})
const bariloche = new Montana("Bariloche", ["Escabio", "Tabla de Snowboard", "Vacuna"], 1500, 2000, 5001)