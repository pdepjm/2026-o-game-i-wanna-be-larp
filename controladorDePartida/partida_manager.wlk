
object partida {
  var aura = 50
  var vidas = 3
  const auraPasiva = 25

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

  method habilitarGeneracionAura(){

    game.onTick(12000, "auraPasiva", {
    self.generarAuraPasiva()
  })


  }

  method generarAuraPasiva() {
  self.sumarAura(auraPasiva)
  }
}