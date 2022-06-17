class Minion {
	var property bananas = 0
	var property armas = []
	var property estado = normal 
	var property maldades = 0
	method esPeligroso() = estado.peligroso(armas)
	method nivelDeConcentracion() = estado.concentracion(armas, bananas)
	method otorgarArma(arma) {
		armas.add(arma)
	}
	method consumirSueroMutante() {
		estado.recibirSuero(self)
	}
	method alimentar(cantidad) {
		bananas+=cantidad
	}
	method comerBanana() {
		bananas--
	}
	method tieneArma(arma) {
		return armas.any({arma1 => arma1.nombre()==arma})
	}
}

object normal {
	method peligroso(armas) = armas.size()>2
	method concentracion(armas, bananas) = armas.max({arma=> arma.poder()}).poder() + bananas
	method recibirSuero(minion) {
		minion.estado(mutante)
		minion.armas([])
		minion.bananas(minion.bananas()-1)
	}
}

object mutante {
	method peligroso(armas) = true
	method concentracion(armas, bananas) = bananas
	method recibirSuero(minion) {
		minion.estado(normal)
		minion.bananas(minion.bananas()-1)
	}
}

class Arma {
	const property nombre
	const property poder
}

const rayoCongelante = new Arma (nombre = "Rayo Congelante", poder = 10)


class Villano {
	const minions = []
	var ciudad
	method nuevoMinion() {
		minions.add(new Minion(armas=[rayoCongelante], bananas = 5))
	}
	method agregarMinion(minion) {
		minions.add(minion)
	}
	method otorgarArma(minion, arma) {
		minion.armas().add(arma)
	}
	method alimentar(minion, bananas) {
		minion.bananas(minion.bananas()+bananas)
	}
	method nivelDeConcentracion(minion) = minion.concentracion()
	method esPeligroso(minion) = minion.peligroso()
	method planificar(maldad) {
		maldad.asignarMinions(minions)
		maldad.ciudad(ciudad)
	}
	method realizar(maldad) {
		maldad.realizar()
	}
	method minionsUtiles() {
		minions.sortBy({minion1,minion2=>minion1.maldades()>minion2.maldades()})
		return minions.filter({minion1 => minion1.maldades()==minions.first().maldades()})
	}
	method minionsInutiles() {
		minions.sortBy({minion1,minion2=>minion1.maldades()<minion2.maldades()})
		return minions.filter({minion1 => minion1.maldades()==minions.first().maldades()})
	}
}

class Maldad {
	var property minionsAsignados = []
	var property ciudad = null
	const mensaje = "No hay minions asignados"
}

class Congelar inherits Maldad {
	method asignarMinions(minions) {
		minionsAsignados = minions.filter({minion => ((minion.tieneArma("Rayo Congelante"))&&(minion.nivelDeConcentracion()>=500))})
	}
	method realizar() {
		if (minionsAsignados.size()==0) {
			throw new Exception(message=mensaje)
		}
		else {
			ciudad.temperatura(ciudad.temperatura()-30)
			minionsAsignados.forEach({minion => minion.bananas(minion.bananas()+10) minion.maldades(minion.maldades()+1)})
		}
	}
}

class Robar inherits Maldad {
	var property objeto = null
	method asignarMinions(minions) {
		minions.filter({minion => (minion.esPeligroso()&&objeto.esApto(minion))})
	}
	method realizar() {
		if (minionsAsignados.size()==0) {
			throw new Exception(message=mensaje)
		}
		else if (ciudad.objetos().filter({elemento => elemento==objeto})==null) {
			throw new Exception(message="La ciudad no tiene el objeto")
		}
		else {
			ciudad.objetos().remove(objeto)
			minionsAsignados.forEach({minion => minion.bananas(minion.bananas()+10) minion.maldades(minion.maldades()+1)})
		}
	}
}

class Ciudad {
	var property temperatura
	const objetos = []
}

object piramide {
	var property altura = 100
	method esApto(minion) {
		return (minion.nivelDeConcentracion()>=altura/2)
	}
	method premiar(minions) {
		minions.forEach({minion => minion.bananas(minion.bananas()+10) minion.maldades(minion.maldades()+1)})
	}
}

object sueroMutante {
	method esApto(minion) {
		return ((minion.bananas()>=100)&&(minion.nivelDeConcentracion()>=23))
	}
	method premiar(minions) {
		minions.forEach({minion => minion.consumirSueroMutante() minion.maldades(minion.maldades()+1)})
	}
}

object laLuna {
	method esApto(minion) {
		return (minion.tieneArma("Rayo para Encoger"))
	}
	method premiar(minions) {
		minions.forEach({minion => minion.otorgarArma(rayoCongelante) minion.maldades(minion.maldades()+1)})
	}
}