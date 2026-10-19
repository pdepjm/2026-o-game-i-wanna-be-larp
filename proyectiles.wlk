import wollok.game.*
import archivo_invasion.*

class Proyectil {
  var property position
  const danio
    method image() = "proyectil_chadlanzador.png"

    method impactarSiHayNormieEn(posicionImpacto) {
        const normie = invasion.normieEn(posicionImpacto)

        if (!normie.estaMuerto()) {
            normie.recibirDanio(danio)
            proyectiles.quitar(self)
            return true
        }

        return false
    }

    method avanzar() {
        if (!self.impactarSiHayNormieEn(position)) {
            const siguiente = position.right(1)

        if (siguiente.x() >= game.width()) {
            proyectiles.quitar(self)
        } else if (!self.impactarSiHayNormieEn(siguiente)) {
            position = siguiente
        }
    }
}
}

object proyectiles {
  const activos = []

  method agregar(proyectil) {
    activos.add(proyectil)
    game.addVisual(proyectil)
  }

  method quitar(proyectil) {
    activos.remove(proyectil)
    game.removeVisual(proyectil)
  }

  method avanzarTodos() {
    activos.copy().forEach({ proyectil =>
      proyectil.avanzar()
    })
  }

  method todos() = activos
}