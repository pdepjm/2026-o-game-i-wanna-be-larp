import archivo_invasion.*
import wollok.game.*
import chads.*
import menuCartas.*
import archivo_jardin.*

object partida {
  var vidas = 3

  method vidas() = vidas

  method perderVida() {
    vidas -= 1
  }

  method sinVidas() = vidas == 0
}


//Para evitar el uso de NULL
object nada {
  method recibirDanio(cantidad) { }
  method estaMuerto() = true
}


object seleccion {
    var cartaElegida = null

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
    if ((cartaElegida != null) && jardin.chadPlantadoEn(posicion).estaMuerto()) {
      
      jardin.agregar(cartaElegida.crearChadEn(posicion))
      escenario.reordenar()


    }
  }
}

object escenario {
  method reordenar() {
    const todos = jardin.plantasEnJardin() + invasion.todos()
    const ordenados = todos.sortedBy({ a, b => a.position().y() > b.position().y() })
    ordenados.forEach({ visual =>
      game.removeVisual(visual)
      game.addVisual(visual)
    })
  }
}