import wollok.game.*

object partida {
  var aura = 100
  var vidas = 3
  const auraPasiva = 25
  var property alPerder = { }

  method vidas() = vidas
  method aura() = aura

  method reiniciar() {
    aura = 100
    vidas = 3
  }

  method perderVida() {
    if (vidas > 0) {
      vidas -= 1
      console.println("Perdiste una vida. Vidas restantes: " + vidas)
      if (vidas == 0) {
        console.println("PERDISTE BRO")
        alPerder.apply()
      }
    }
  }

  method sumarAura(recursosGenerados) {
    aura += recursosGenerados
  }

  method tieneAuraSuficiente(costo) = aura >= costo

  method gastarAura(costo) {
    if (self.tieneAuraSuficiente(costo)) {
      aura -= costo
      return true
    }
    return false
  }

  method habilitarGeneracionAura() {
    game.onTick(12000, "auraPasiva", {
      self.generarAuraPasiva()
    })
  }

  method deshabilitarGeneracionAura() {
    game.removeTickEvent("auraPasiva")
  }

  method generarAuraPasiva() {
    self.sumarAura(auraPasiva)
  }
  
  method enCurso() = vidas > 0

}