class Viaje{
	var property localidadOrigen;
	var localidadDestino;
	var property medioDeTransporte;
	
	constructor(unaLocalidadOrigen, unaLocalidadDestino, unMedioDeTrasporte){
		localidadOrigen = unaLocalidadOrigen
		localidadDestino = unaLocalidadDestino
		medioDeTransporte = unMedioDeTrasporte
	}
	
	method localidadDestino(){
		return localidadDestino
	}
	
	method getPrecio(){
		return self.distancia() * medioDeTransporte.getPrecioPorKilometro() + localidadDestino.getPrecio();
	}
	
	method distancia(){
		return localidadOrigen.distanciaA(localidadDestino);
	}
}
