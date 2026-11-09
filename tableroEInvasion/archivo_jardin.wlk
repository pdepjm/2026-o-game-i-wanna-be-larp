import tablero.*
import chadsYNormies.chads.*


object jardin {
  
  
  
  method limiteAnchoJardin() = 11
  method limitePodadora() = 3
  method limiteAltoJardin() = 4
  method altoJardin() = 5   
  


  const plantasEnJardin = []

  method plantasEnJardin() = plantasEnJardin

  method agregar(planta) {
    plantasEnJardin.add(planta)
    game.addVisual(planta)
    planta.habilitarActuacion()
  }

  method quitar(planta) {
    planta.terminarActuacion()
    plantasEnJardin.remove(planta)
    game.removeVisual(planta)
  }

  method chadPlantadoEn(posicion) = plantasEnJardin.findOrDefault(
    { p => p.position().x() == posicion.x() && p.position().y() == posicion.y() },
    nada
  )
}