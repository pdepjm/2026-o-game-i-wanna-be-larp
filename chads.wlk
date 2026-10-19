import wollok.game.*
import tablero.*
import partida_manager.*
import archivo_jardin.*
import archivo_invasion.*
import proyectiles.*

//archivo para definir las clases de los chads
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

  method generarRecursos() {}
  


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
  const danio
  override method image() = "chadprime.png" //nose cual imagen seria

  override method actuar() {
    const objetivo = invasion.normieMasCercanoDelanteDe(position)

    if (!objetivo.estaMuerto()) {
      proyectiles.agregar(
        new Proyectil(position = position, danio = danio)
      )
    }
  }
  override method recibirA(normie){

    normie.frenarAnte(self)

  }

}

// Generador de economía: produce recursos periódicos para costear nuevas unidades
class ChadOmnisciente inherits Chad {
  const recursosGenerados
  var generandoAura = false
  var segundosDesdeUltimaGeneracion = new Range(start = 0, end = 9).anyOne()

  override method image() {
  if (generandoAura) {
    return "chad_omnisciente_aura.png"
  }
  return "chad_omnisciente.png"
  }

  override method actuar() {
    generandoAura = false
  }

  override method generarRecursos() {
    segundosDesdeUltimaGeneracion += 1

    if (segundosDesdeUltimaGeneracion >= 10) {
      partida.sumarAura(recursosGenerados)
      segundosDesdeUltimaGeneracion = 0
      generandoAura = true
    }
  }

  override method recibirA(normie) {
    normie.frenarAnte(self)
  }
}