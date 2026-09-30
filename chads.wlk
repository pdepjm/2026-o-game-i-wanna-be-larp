import wollok.game.*
import tablero.*

class Chad {
  var property position
  var vida = 200
  const vidaMaxima

  method vida() = vida
  method estaMuerto() = vida <= 0

  method image()

  method recibirDanio(cantidad) {
    vida = vida - cantidad
    if (self.estaMuerto()) {
      jardin.quitar(self)
    }
  }

  method actuar() { }
}

// Defensor tipo tanque: absorbe golpes y cambia de apariencia según su vida restante
class ChadMuro inherits Chad {
  override method image() {
    const porcentaje = vida / vidaMaxima
    if (porcentaje > 0.66) return "murachadfase1.png"
    if (porcentaje > 0.33) return "murachadfase2.png"
    return "murachadfase3.png"
  }
}

// Defensor a distancia: busca al enemigo más próximo en su carril y le aplica daño
class ChadLanzador inherits Chad {
  const danio = 20
  override method image() = "imagen.png" //nose cual imagen seria

  override methor actuar(){
    const objetivo = invasion.primeNormieEnFila(position.y(), position.x())
    if(!objetivo.estaMuerto()){
      objetivo.recibirDanio(danio)
    }
  }
}

// Generador de economía: produce recursos periódicos para costear nuevas unidades
class ChadOmnisciente inherits Chad {
  const recursosGenerados = 25

  override method image() = "chad_omnisciente.png"

  override method actuar() {
    jardin.sumarAura(recursosGenerados)
  }
}