import wollok.game.*
import tablero.*

class Normie {
  var property position
  //var vida = 100
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