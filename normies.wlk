import wollok.game.*
import tablero.*

class Normie {
  var property position
  var vida 

  method vida() = vida
  method estaMuerto() = vida <= 0

   method recibirDanio(cantidad) {
    vida = vida - cantidad
    if (self.estaMuerto()) {
      invasion.quitar(self)
    }
  }




  var objetivo = nada

  method image() {
    if (objetivo.estaMuerto()) return "normieNormal.png"
    else return "normieNormalAttack.png"
  }

  method avanzar() {
    const siguiente = position.left(1)
    const chad = jardin.chadPlantadoEn(siguiente)
    if (chad.estaMuerto()) position = siguiente
    else objetivo = chad
  }

  method atacar() {
    objetivo.recibirDanio(10)
    if (objetivo.estaMuerto()) objetivo = nada
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