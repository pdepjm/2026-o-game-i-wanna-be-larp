import wollok.game.*
import tablero.*

class ChadMuro {
  var property position
  var vida = 200
  const vidaMaxima = 200.0

  method vida() = vida
  method estaMuerto() = vida <= 0

  method image() {
    const porcentaje = vida / vidaMaxima
    if (porcentaje > 0.66) return "murachadfase1.png"
    if (porcentaje > 0.33) return "murachadfase2.png"
    return "murachadfase3.png"
  }

  method recibirDanio(cantidad) {
    vida = vida - cantidad
    if (self.estaMuerto()) jardin.quitar(self)
  }
}