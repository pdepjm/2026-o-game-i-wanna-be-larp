

object elFoxyQueNoInvitoNadie {
  var property position = game.origin()
  const foxySonido = game.sound("fnaf-2-death-scream.mp3")
  const estaticaSonido = game.sound("fnaf-2-static.mp3")
  //
  method image() = "foxy-fnaf.gif"
  method jumpscare() {
    var numero = 0.randomUpTo(20) 
    console.println(numero)
    if (numero >= 19) {
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