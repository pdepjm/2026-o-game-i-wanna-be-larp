import wollok.game.*
import tableroEInvasion.archivo_invasion.*
import tableroEInvasion.efectos.*

class Proyectil {
  var property position
  const danio

    method image() 

    method impactarEn(normie){

        normie.recibirDanio(danio)

    }

    method impactarSiHayNormieEn(posicionImpacto) {
        const normie = invasion.normieEn(posicionImpacto)

        if (!normie.estaMuerto()) {
            self.impactarEn(normie)
            proyectilesActivos.quitar(self)
            return true
        }

        return false
    }

    method avanzar() {
        if (!self.impactarSiHayNormieEn(position)) {
            const siguiente = position.right(1)

        if (siguiente.x() >= game.width()) {
            proyectilesActivos.quitar(self)
        } else if (!self.impactarSiHayNormieEn(siguiente)) {
            position = siguiente
        }
    }
}
}

class ProyectilComun inherits Proyectil{

      override method image() = "proyectil_chadlanzador.png"


} 

class ProyectilFuego inherits Proyectil{

      

      override method image() = "proyectil_chadlanzador.png"

      override method impactarEn(normie){

            super(normie)

            fuego.quemarNormie(normie)
      }


}




object proyectilesActivos {
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