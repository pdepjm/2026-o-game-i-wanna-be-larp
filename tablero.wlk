
import wollok.game.*
import chads.*
import menuCartas.*

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

object jardin {
  
  
  var aura = 0
  method limiteAnchoJardin() = 11
  method limitePodadora() = 3
  method limiteAltoJardin() = 4
  method altoJardin() = 5   
  


  const plantasEnJardin = []

  method plantasEnJardin() = plantasEnJardin

  method agregar(planta) {
    plantasEnJardin.add(planta)
    game.addVisual(planta)
  }

  method quitar(planta) {
    plantasEnJardin.remove(planta)
    game.removeVisual(planta)
  }

  method sumarAura(recursosGenerados){

    aura += recursosGenerados

  }

  method chadPlantadoEn(posicion) = plantasEnJardin.findOrDefault(
    { p => p.position().x() == posicion.x() && p.position().y() == posicion.y() },
    nada
  )
}

object invasion {
  const normies = []

  method agregar(normie) {
    normies.add(normie)
    game.addVisual(normie)
  }

  method quitar(normie) {
    normies.remove(normie)
    game.removeVisual(normie)
  }

  method primerNormieEnFila(posy){

    return normies.find({normie => (normie.position().y() == posy)})


  }


  method todos() = normies
}

object seleccion {
    var cartaElegida = null

  method elegirChad(chad) {

        cartaElegida = chad

  }

  method plantarEn(posicion) {
    if ((cartaElegida != null) && jardin.chadPlantadoEn(posicion).estaMuerto()) {
      
      jardin.agregar((cartaElegida.chadQueRepresenta()).instanciarse(posicion))
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