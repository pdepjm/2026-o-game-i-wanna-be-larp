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




  

  method image() 


  method actuarAnte(chad) //metodo abstracto donde el normie hace una accion cuando tiene un chad enfrente
                                                       
  method frenarAnte(chad){

    frenado = true
    self.atacar(chad)


  }

  method checkearQueHayEnFrente(siguiente){

    const chad = jardin.chadPlantadoEn(siguiente)
    
    if(chad != nada){
    
    self.actuarAnte(chad)

    }else{
      
      estaAtacando = false
      frenado = false

    }



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

  method atacar(chad) //cada normie ataca a un chad a su manera

  method llegoALaCasa() = position.x() == 0 
}

class NormieComun inherits Normie{

  override method image() {
    if (!estaAtacando) return "normieNormal.png"
    else return "normieNormalAttack.png"
  }

  override method actuarAnte(chad){

    chad.recibirA(self)

  }

  override method atacar(chad){
    
    estaAtacando = true
    chad.recibirDanio(danio)

  }

}


class NormieRapido inherits Normie {

  override method image() {
    if (!estaAtacando) return "normieRapido.png" // La imagen de tu normie rápido
    else return "normieRapidoAttack.png"
  }

  override method actuarAnte(chad) {
    chad.recibirA(self)
  }

  override method atacar(chad) {
    estaAtacando = true
    chad.recibirDanio(danio)
  }
}


class NormieTanque inherits Normie {
  override method image() {
    if (!estaAtacando) return "normieTanque.png"
    else return "normieTanqueAttack.png"
  }

  override method actuarAnte(chad) {
    chad.recibirA(self)
  }

  override method atacar(chad) {
    estaAtacando = true
    chad.recibirDanio(danio)
  }
}


