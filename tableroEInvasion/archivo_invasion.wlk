import tablero.*
import chadsYNormies.*

object invasion {
  const normies = []

  method agregar(normie) {
    
    
    normies.add(normie)
    game.addVisual(normie)
    normie.habilitarMovimiento()

  }

  method quitar(normie) {
    normie.deshabilitarMovimiento()
    normies.remove(normie)
    game.removeVisual(normie)
  }

  method normieMasCercanoDelanteDe(posicion) =
    normies.filter({ n =>
      n.position().y() == posicion.y() &&
      n.position().x() > posicion.x() &&
      !n.estaMuerto()
    }).minIfEmpty(
      { n => n.position().x() },
      { nada }
    )

   

  method todos() = normies

  method normieEn(posicion) =
  normies.findOrDefault(
    { n =>
      n.position().x() == posicion.x() &&
      n.position().y() == posicion.y() &&
      !n.estaMuerto()
    },
    nada
  )
  
}




