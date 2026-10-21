import archivo_invasion.*
import wollok.game.*
import chads.*
import menuCartas.*
import archivo_jardin.*
<<<<<<< HEAD

object partida {
  var vidas = 3

  method vidas() = vidas

  method perderVida() {
    vidas -= 1
  }

  method sinVidas() = vidas == 0
}

=======
import partida_manager.*
import proyectiles.*
>>>>>>> origin/develop

//Para evitar el uso de NULL
object nada {
  method recibirDanio(cantidad) { }
  method estaMuerto() = true
  method recibirA(normie) { normie.pasar()}
}


object seleccion {
    var cartaElegida = sinCartaElegida

  method habilitarSeleccion(posicion){

    if (menuDeCartas.hayCartaEn(posicion)) {
            
      self.elegirChad(menuDeCartas.chadEn(posicion))

    } else if (posicion.x() >= jardin.limitePodadora() && posicion.x() <= jardin.limiteAnchoJardin() && posicion.y() <= jardin.limiteAltoJardin()) {
      
      //si la posicion donde se clickea no excede los limites del jardin, se pasa a plantar el chad
      
      self.plantarEn(posicion)

    }


  }
  
  method elegirChad(chad) {

        cartaElegida = chad

  }

  method plantarEn(posicion) {
<<<<<<< HEAD
    if ((cartaElegida != null) && jardin.chadPlantadoEn(posicion).estaMuerto()) {
      
=======
    if (cartaElegida.esCarta() &&
        jardin.chadPlantadoEn(posicion).estaMuerto() &&
        partida.gastarAura(cartaElegida.costo())) {
>>>>>>> origin/develop
      jardin.agregar(cartaElegida.crearChadEn(posicion))
      escenario.reordenar()
    }
  }
}

object escenario {
method reordenar() {
  const todos = jardin.plantasEnJardin() + invasion.todos()
  const ordenados = todos.sortedBy({ a, b =>
    a.position().y() > b.position().y()
  })

  ordenados.forEach({ visual =>
    game.removeVisual(visual)
    game.addVisual(visual)
  })

  proyectiles.todos().forEach({ proyectil =>
    game.removeVisual(proyectil)
    game.addVisual(proyectil)
  })
}
}