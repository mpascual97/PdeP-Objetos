import Localidad.*
import Usuario.*
import Viaje.*
import MedioDeTransporte.*
import Perfil.*

object barrileteCosmico{
	var localidades = #{};
	var property mediosDeTransporte;
	
	method setLocalidades(unasLocalidades){
		localidades = unasLocalidades
	}
	
	method getLocalidades(){
		return localidades
	}
	
	
	method obtenerDestinosMasImportantes(){
		return localidades.filter({destino => destino.EsDestinoImportante()})
	}
	
	method aplicarDescuentos(unPorcentaje){
		localidades.forEach({destino => destino.aplicarDescuento(unPorcentaje)});			
	}
	
	method esExtrema(){
		return localidades.any({destino => destino.esPeligroso()});
	}
	
	method cartaDeDestinos(){
		return localidades.map({destino => destino.getNombre()})
	}	
	
	method todosLosDestinosTienenCertificado(){
		return localidades.all({destino => destino.tieneCertificadoDeDescuento()})
	}
	
	method armarViaje(unUsuario, unaLocalidad){
		var nuevoViaje = new Viaje(unUsuario.localidadOrigen(), unaLocalidad, unUsuario.perfil().elegirMedioDeTransporte(unUsuario, unUsuario.localidadOrigen().distanciaA(unaLocalidad)));
		 
		unUsuario.realizarViaje(nuevoViaje);
	}
}

