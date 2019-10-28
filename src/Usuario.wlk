import Perfil.*
class DineroInsuficienteExpception inherits Exception{}

class Usuario{
	var nombreCompleto;
	var nombreDeUsuario;
	var dineroDisponible;
	var viajes;
	var siguiendo; //Conjunto ya que no debe aceptar repetidos
	var localidadOrigen; 
	var property perfil;
	
	constructor (unNombreCompleto, unNombreDeUsuario, unDinero, unosViajes, unosUsuarios, unaLocalidad, unPerfil){
		nombreCompleto = unNombreCompleto
		nombreDeUsuario = unNombreDeUsuario
		dineroDisponible = unDinero
		viajes = unosViajes
		siguiendo = unosUsuarios
		localidadOrigen = unaLocalidad		
		perfil = unPerfil
	}
	
	method getLocalidadDeOrigen(){
		return localidadOrigen;
	}
	method getViajes(){
		return viajes;
	}
	
	method getDinero(){
		return dineroDisponible;
	}
	
	method localidadOrigen(){
		return localidadOrigen;
	}
	
	method realizarViaje(unViaje){
		if (dineroDisponible >= unViaje.getPrecio()){
			dineroDisponible -= unViaje.getPrecio()
			viajes.add(unViaje);
			localidadOrigen = unViaje.localidadDestino();
		}else{
			throw new DineroInsuficienteExpception(message = "Dinero insuficiente");
		}
	}
	
	method kilometrosRecorridos(){
		return viajes.sum({viaje => viaje.distancia()});
	}
	
	method seguirA(unUsuario){
		siguiendo.add(unUsuario)
		unUsuario.AgregarASiguiendo(self)
	}
	
	method AgregarASiguiendo(unUsuario){
		siguiendo.add(unUsuario);
	}
}

