
<<<<<<< HEAD


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


  
=======
object partida {
  var aura = 50
  var vidas = 3

  method vidas() = vidas
  method aura() = aura

  method perderVida() {
    if (vidas > 0) {
      vidas -= 1
      console.println("Perdiste una vida. Vidas restantes: " + vidas)
      if (vidas == 0) {
        console.println("PERDISTE BRO")
        game.stop()
      }
    }
  }

  method sumarAura(recursosGenerados) {
    aura += recursosGenerados
  }

  method tieneAuraSuficiente(costo) =
    aura >= costo

  method gastarAura(costo) {
    if (self.tieneAuraSuficiente(costo)) {
      aura -= costo
      return true
    }
    return false
  }

  method generarAuraPasiva() {
  self.sumarAura(25)
  }
>>>>>>> origin/develop
}