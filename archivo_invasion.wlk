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

<<<<<<< HEAD
   method primerNormieEnFila(posy){

    return normies.findOrDefault({normie => (normie.position().y() == posy)},nada)

  }

   method avanzar_invasion(){

        normies.forEach({ normie => 
    normie.avanzar()}) 

   }



  method todos() = normies
=======
  method normieMasCercanoDelanteDe(posicion) =
    normies.filter({ n =>
      n.position().y() == posicion.y() &&
      n.position().x() > posicion.x() &&
      !n.estaMuerto()
    }).minIfEmpty(
      { n => n.position().x() },
      { nada }
    )

   method avanzar_invasion(){
    normies.copy().forEach({ normie => normie.avanzar()})
   }

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
  
>>>>>>> origin/develop
}




<<<<<<< HEAD
=======

>>>>>>> origin/develop
