import tablero.*


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

    return normies.findOrDefault({normie => (normie.position().y() == posy)},nada)

  }

   method avanzar_invasion(){

        normies.forEach({ normie => 
    normie.avanzar()}) 

   }



  method todos() = normies
}




