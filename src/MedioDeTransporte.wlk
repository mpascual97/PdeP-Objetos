class MedioDeTransporte{	
	var property velocidad;
	
	constructor (unaVelocidad){
			velocidad = unaVelocidad;
	}
	
	method getPrecioPorKilometro();
}

class Avion inherits MedioDeTransporte{
	var turbinas
	
	constructor (unaVelocidad, unasTurbinas) =
	super(unaVelocidad){
	
	turbinas = unasTurbinas

	}
	
	override method getPrecioPorKilometro(){
		return turbinas.sum({turbina => turbina.nivelImpulso()})
	}
}

class Turbina {
	var property nivelImpulso
	
	constructor (unNivel){
		nivelImpulso = unNivel
	}
}

class Micro inherits MedioDeTransporte{
	override method getPrecioPorKilometro() = 5000
}

class Tren inherits MedioDeTransporte{
	
	override method getPrecioPorKilometro() =
		return 2300*1.609
}

class Barco inherits MedioDeTransporte{
	var probabilidadDeChoque
	
	constructor (unaVelocidad, unaProbabilidad) =
	super(unaVelocidad){
	
	probabilidadDeChoque = unaProbabilidad

	}
	
	override method getPrecioPorKilometro(){
		return 1000 * probabilidadDeChoque
	}
}