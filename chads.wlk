import wollok.game.*
import tablero.*

class Chad {
  var property position
  var vida 
  const vidaMaxima

  method vida() = vida
  method estaMuerto() = vida <= 0

  method image() 

  method recibirDanio(cantidad) {
    vida = vida - cantidad
    if (self.estaMuerto()) jardin.quitar(self)
  }

  

}



class ChadMuro inherits Chad {
  override method image() {
    const porcentaje = vida / vidaMaxima
    if (porcentaje > 0.66) return "murachadfase1.png"
    if (porcentaje > 0.33) return "murachadfase2.png"
    return "murachadfase3.png"
  }
//la unica forma que encontre para integrar estas clases con el metodo de plantar fue hacer que la clase se instancie a si misma
  method instanciarse(nuevaPosicion, nuevaVida, nuevaVidaMax){

      return new ChadMuro(position = nuevaPosicion,vida = nuevaVida,vidaMaxima = nuevaVidaMax)

  }


}