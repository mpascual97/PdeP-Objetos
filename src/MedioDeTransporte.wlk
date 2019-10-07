class MedioDeTransporte{	
	var velocidad;
	var precioPorKilometro;
	
	constructor (unPrecio, unaVelocidad){
			precioPorKilometro = unPrecio;
			velocidad = unaVelocidad;
	}
	
	method getPrecioPorKilometro(){
		return precioPorKilometro;		
	}
}
