import BarrileteCosmico.*

class SinMediosDeTransporteDisponiblesExpception inherits Exception{}

class Perfil{
	method elegirMedioDeTransporte(unUsuario, unaDistancia);
}

object empresarial inherits Perfil{
	override method elegirMedioDeTransporte(unUsuario, unaDistancia){
		return barrileteCosmico.mediosDeTransporte().max({medioDeTransporte => medioDeTransporte.velocidad()})
	}
}

object estudiantil inherits Perfil{
	override method elegirMedioDeTransporte(unUsuario, unaDistancia){
		var mediosDisponibles = barrileteCosmico.mediosDeTransporte().filter({medioDeTransporte=> medioDeTransporte.getPrecioPorKilometro() * unaDistancia <= unUsuario.getDinero()})
		if(mediosDisponibles.size() == 0)
			throw new SinMediosDeTransporteDisponiblesExpception(message = "Dinero insuficiente")
		 else
		 	return mediosDisponibles.max({medioDeTransporte => medioDeTransporte.velocidad()})
	}
}

object grupoFamiliar inherits Perfil{
	override method elegirMedioDeTransporte(unUsuario, unaDistancia){
		return barrileteCosmico.mediosDeTransporte().anyOne()
	}
}

