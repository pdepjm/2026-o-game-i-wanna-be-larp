import archivo_invasion.*
import wollok.game.*
import chadsYNormies.chads.*
import chadsYNormies.menuCartas.*
import archivo_jardin.*
import controladorDePartida.partida_manager.*
import proyectiles.*
import laPala.*

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
      laPala.deseleccionarPala()

    } else if (!jardin.chadPlantadoEn(posicion).estaMuerto() && laPala.palaSeleccionada()) {
      
      //si la posicion es donde hay actualmente un chad, y esta la pala seleccionada, esta saca el chad en esa posicion
      
      jardin.quitar(jardin.chadPlantadoEn(posicion))
      
    } else if (posicion.x() >= jardin.limitePodadora() && posicion.x() <= jardin.limiteAnchoJardin() && posicion.y() <= jardin.limiteAltoJardin()) {
      
      //si la posicion donde se clickea no excede los limites del jardin, se pasa a plantar el chad
      
      self.plantarEn(posicion)

    }


  }
  
  method elegirChad(chad) {

        cartaElegida = chad

  }

  method plantarEn(posicion) {
    if (cartaElegida.esCarta() &&
        jardin.chadPlantadoEn(posicion).estaMuerto() &&
        partida.gastarAura(cartaElegida.costo())) {
      jardin.agregar(cartaElegida.crearChadEn(posicion))
      escenario.reordenar()
    }
  }

  method reiniciar() {
    cartaElegida = sinCartaElegida
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

  proyectilesActivos.todos().forEach({ proyectil =>
    game.removeVisual(proyectil)
    game.addVisual(proyectil)
  })
}
}