import wollok.game.*
import tablero.*
import partida_manager.*
import archivo_jardin.*
import archivo_invasion.*

class Chad {
  var property position
  var vida 
  var vidaMaxima

  method vida() = vida
  method estaMuerto() = vida <= 0

  method recibirA(normie) //un chad recibe a un normie a su manera

  method actuar()

  method image()

  method recibirDanio(cantidad) {
    vida = vida - cantidad
    if (self.estaMuerto()) {
      jardin.quitar(self)
    }
  }

  


}



// Defensor tipo tanque: absorbe golpes y cambia de apariencia según su vida restante
class ChadMuro inherits Chad {
  override method image() {
    const porcentaje = vida / vidaMaxima
    if (porcentaje > 0.66) return "murachadfase1.png"
    if (porcentaje > 0.33) return "murachadfase2.png"
    return "murachadfase3.png"
  }
//la unica forma que encontre para integrar estas clases con el metodo de plantar fue hacer que la clase se instancie a si misma
  
  override method actuar(){}
  
  

  override method recibirA(normie){

      normie.frenarAnte(self)    

  }

}

// Defensor a distancia: busca al enemigo más próximo en su carril y le aplica daño
class ChadLanzador inherits Chad {
  const danio = 20
  override method image() = "chadprime.png" //nose cual imagen seria

  override method actuar(){
    const objetivo = invasion.primerNormieEnFila(position.y())
    if(objetivo != null && !objetivo.estaMuerto()){
      objetivo.recibirDanio(danio)
    }
  }

  

  override method recibirA(normie){

    normie.frenarAnte(self)


  }


}

// Generador de economía: produce recursos periódicos para costear nuevas unidades
class ChadOmnisciente inherits Chad {
  const recursosGenerados = 25

  override method image() = "chad_omnisciente.png"

   override method actuar() {
    partida.sumarAura(recursosGenerados)
  }

  override method recibirA(normie){

    normie.frenarAnte(self)

  }

}