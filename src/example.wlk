object gameflix {
	const property juegos = new Set()
	const usuarios = new Set()
	
	method agregarJuego(juego){
		juegos.add(juego)
	}
	method agregarUsuario(usuario){
		usuarios.add(usuario)
	}
	method juegosDeCategoria(categoria) = juegos.filter({ juego => juego.categoria().equals(categoria) })
	method juegosBaratos() = juegos.filter({ juego => juego.esBarato() })
	method juegoPorNombre(nombre) {
		// ver si existe, si no existe, lanzar excepcion
	}
	method cualquierJuego() = juegos.anyOne()
}

class Usuario {
	var subscripcion
	var plata
	method actualizarSubscripcion(subs) {
		subscripcion = subs
	}
	method juegosDisponibles() = subscripcion.juegosDisponibles()
	method pagar() {
		if (plata >= subscripcion.precio()){
			plata = plata - subscripcion.precio()
		} else {
			self.actualizarSubscripcion(prueba)
		}
	}
	method jugar(juego, horas){
		juego.afectar(self, horas)
	}
}

//De cada juego, conocemos su nombre, su precio en el mercado y su categoría. 
//Los juegos violentos reducen el humor en 10 unidades por cada hora jugada.
//Cada vez que un usuario juega un MOBA, se ve obligado a comprar skins para sus personajes gastando $30.
//Siempre que un usuario juega un juego de terror, tira todo al carajo y se pasa a la suscripción Infantil
//Los juegos estratégicos aumentan el humor del usuario en 5 unidades por cada hora jugada.
class Juego {
	const nombre
	const precio
	//const tipo
	const property categoria
	method esBarato() = precio < 30
	method afectar(usuario)
//	method afectar(usuario){
//		tipo.afectar(usuario)		
//	}
}

//object terror{
//	method afectar(usuario){
//		usuario.actualizarSubscripcion(infantil)	
//	}
//}

class JuegoDeTerror inherits Juego {
	method afectar(usuario, horas){
		usuario.actualizarSubscripcion(infantil)	
	}
}

object premium {
	method juegosDisponibles() = gameflix.juegos()
	method precio() = 50
}
object base {
	method juegosDisponibles() = gameflix.juegosBaratos()
	method precio() = 25
}
object infantil {
	method juegosDisponibles() = gameflix.juegosDeCategoria("Infantil") 
	method precio() = 10
}
object prueba {
	method juegosDisponibles() = gameflix.juegosDeCategoria("Demo") 
	method precio() = 0
}