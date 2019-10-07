class Viaje{
	var localidadOrigen;
	var localidadDestino;
	var medioDeTrasporte;
	
	constructor(unaLocalidadOrigen, unaLocalidadDestino, unMedioDeTrasporte){
		localidadOrigen = unaLocalidadOrigen
		localidadDestino = unaLocalidadDestino
		medioDeTrasporte = unMedioDeTrasporte
	}
	
	method localidadDestino(){
		return localidadDestino
	}
	
	method getPrecio(){
		return self.distancia() * medioDeTrasporte.getPrecioPorKilometro() + localidadDestino.getPrecio();
	}
	
	method distancia(){
		return localidadOrigen.distanciaA(localidadDestino);
	}
}
