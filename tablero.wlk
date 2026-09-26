import wollok.game.*
import chads.*

//Para evitar el uso de NULL
object nada {
  method recibirDanio(cantidad) { }
  method estaMuerto() = true
}

object jardin {
  const plantas = []

  method plantas() = plantas

  method agregar(planta) {
    plantas.add(planta)
    game.addVisual(planta)
  }

  method quitar(planta) {
    plantas.remove(planta)
    game.removeVisual(planta)
  }

  method chadEn(posicion) = plantas.findOrDefault(
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

  method todos() = normies
}

object carta {
  var property position = game.at(3, 5)
  method image() = "murachadfase1.png"
}

object seleccion {
  var muroElegido = false

  method elegirMuro() { muroElegido = true }

  method plantarEn(posicion) {
    if (muroElegido && jardin.chadEn(posicion).estaMuerto()) {
      jardin.agregar(new ChadMuro(position = posicion))
      escenario.reordenar()
    }
  }
}

object escenario {
  method reordenar() {
    const todos = jardin.plantas() + invasion.todos()
    const ordenados = todos.sortedBy({ a, b => a.position().y() > b.position().y() })
    ordenados.forEach({ visual =>
      game.removeVisual(visual)
      game.addVisual(visual)
    })
  }
}
