import wollok.game.*
import tablero.*
import archivo_jardin.*
import archivo_invasion.*
import partida_manager.*


//archivo para definir las clases de los normies

class Normie {
  var property position
  var property vida
  var estaAtacando = false
  var frenado = false
  const property danio
  

  method estaMuerto() = vida <= 0

   method recibirDanio(cantidad) {
    vida = vida - cantidad
    if (self.estaMuerto()) {
      invasion.quitar(self)
    }
  }

  method pasar(){
    estaAtacando = false
    frenado = false
  }


  

  method image() 
                                               
  method frenarAnte(chad){

    frenado = true
    self.atacar(chad)


  }

  method checkearQueHayEnFrente(siguiente){
    jardin.chadPlantadoEn(siguiente).recibirA(self)
  }



  method avanzar() {
    const siguiente = position.left(1)
    
    self.checkearQueHayEnFrente(siguiente)

    if(!frenado){

    position = siguiente

    }

    if(self.llegoALaCasa()){

          partida.perderVida()
          invasion.quitar(self)        

    }



  }

  method atacar(chad) {
    chad.recibirDanio(danio)
  } //cada normie ataca a un chad a su manera

  method llegoALaCasa() = position.x() == 0 
}

class NormieComun inherits Normie {

  override method image() {
    if (!estaAtacando) return "normieNormal.png"
    else return "normieNormalAttack.png"
  }

  override method atacar(chad) {
    estaAtacando = true
    super(chad)
  }

}

class NormieRapido inherits Normie {

  override method image() {
    if (!estaAtacando) return "normieRapido.png"
    else return "normieRapidoAttack.png"
  }

  override method atacar(chad) {
    estaAtacando = true
    super(chad)
  }

}

class NormieTanque inherits Normie {

  override method image() {
    if (!estaAtacando) return "normieTanque.png"
    else return "normieTanqueAttack.png"
  }

  override method atacar(chad) {
    estaAtacando = true
    super(chad)
  }

}