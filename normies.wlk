import wollok.game.*
import tablero.*
import archivo_jardin.*
import archivo_invasion.*
import partida_manager.*


class Normie {
  var property position
  var vida 
  var estaAtacando = false  
  var frenado = false
  const danio
  

  method vida() = vida
  method estaMuerto() = vida <= 0

   method recibirDanio(cantidad) {
    vida = vida - cantidad
    if (self.estaMuerto()) {
      invasion.quitar(self)
    }
  }




  

  method image() {
    if (!estaAtacando) return "normieNormal.png"
    else return "normieNormalAttack.png"
  }


  method actuarAnte(chad) //metodo abstracto donde el normie hace una accion cuando tiene un chad enfrente
                                                       
  method frenarAnte(chad){

    frenado = true
    self.atacar(chad)


  }

  method checkearQueHayEnFrente(siguiente){

    const chad = jardin.chadPlantadoEn(siguiente)
    
    if(chad != nada){
    
    self.actuarAnte(chad)

    }else{
      
      estaAtacando = false
      frenado = false

    }



  }


  method avanzar() {
    const siguiente = position.left(1)
    
    self.checkearQueHayEnFrente(siguiente)

    if(!frenado){

    position = siguiente

    }

    if(self.llegoALaCasa()){

          partida.perderVida()
          invasion.quitar(self)        

    }



  }

  method atacar(chad) //cada normie ataca a un chad a su manera

  method llegoALaCasa() = position.x() == 0 
}

class NormieComun inherits Normie{



  override method actuarAnte(chad){

    chad.recibirA(self)

  }

  override method atacar(chad){
    
    estaAtacando = true
    chad.recibirDanio(danio)

  }

}




object elFoxyQueNoInvitoNadie {
  var property position = game.origin()
  const foxySonido = game.sound("fnaf-2-death-scream.mp3")
  const estaticaSonido = game.sound("fnaf-2-static.mp3")

  method image() = "foxy-fnaf.gif"
  method jumpscare() {
    if (0.randomUpTo(20) >= 15) {
		game.schedule(200, { => game.addVisual(self)  })
		foxySonido.play()
		game.schedule(700, { => game.removeVisual(self)  })
		game.schedule(700, { => foxySonido.stop()  })

		game.schedule(700, { => game.addVisual(estatica)  })
		game.schedule(500, { => estaticaSonido.play()  })
		game.schedule(2500, { => game.removeVisual(estatica)  })
		game.schedule(2500, { => estaticaSonido.stop()  })
    }
  }
}

object estatica {
  var property position = game.origin()
  method image() = "bzzz-broken.gif"
}