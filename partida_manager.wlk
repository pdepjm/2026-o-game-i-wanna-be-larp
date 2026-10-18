


object partida {
  var aura = 0
  var vidas = 3

  method vidas() = vidas

  method perderVida() {
    
    vidas -= 1

    console.println(
        "Perdiste una vida. Vidas restantes: " + self.vidas()
      )


  }

   method sumarAura(recursosGenerados){

    aura += recursosGenerados

  }

  method checkearVidas(){

         if (vidas == 0) {
        console.println("PERDISTE BRO")
        game.stop()
      }

  }


  
}