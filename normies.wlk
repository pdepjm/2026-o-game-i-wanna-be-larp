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