import controladorDePartida.partida_manager.*
import wollok.game.*
import tableroEInvasion.tablero.*
import tableroEInvasion.archivo_jardin.*
import tableroEInvasion.archivo_invasion.*
import tableroEInvasion.proyectiles.*
import tableroEInvasion.tiposProyectiles.*

//archivo para definir las clases de los chads
class Chad {
  var property position
  var property vida 
  var property vidaMaxima

  const tiempoActuacion = game.tick(1500,{self.actuar()},false)

 
  method estaMuerto() = vida <= 0

  method recibirA(normie) //un chad recibe a un normie a su manera
  
  method actuar()

  method image()

  method habilitarActuacion(){

    tiempoActuacion.start()


  }

  method terminarActuacion(){

    tiempoActuacion.stop()


  }

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
  const proyectilQueUsa 
  override method image() = "chadprime.png" //nose cual imagen seria

  override method actuar() {
    const objetivo = invasion.normieMasCercanoDelanteDe(position)

    if (!objetivo.estaMuerto()) {
      proyectilesActivos.agregar(
        proyectilQueUsa.crearEn(position)
      )
    }
  }
  override method recibirA(normie){

    normie.frenarAnte(self)

  }


}

class ChadLanzadorFuego inherits ChadLanzador{

  override method image() = "chadFuego.png"


}



// Generador de economía: produce recursos periódicos para costear nuevas unidades
class ChadOmnisciente inherits Chad {
const property recursosGenerados 
  var generandoAura = false
  var segundosDesdeUltimaGeneracion = new Range(start = 0, end = 9).anyOne()

  


  override method image() {
    if (generandoAura) {
      return "chad_omnisciente_aura.png"
    }
    return "chad_omnisciente.png"
  }

  override method actuar() {
    segundosDesdeUltimaGeneracion += 1

    if (segundosDesdeUltimaGeneracion >= 10) {
      partida.sumarAura(recursosGenerados)
      segundosDesdeUltimaGeneracion = 0
      generandoAura = true
      game.schedule(500, {generandoAura = false})

    }
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

class ChadExplosivo inherits Chad {
  const property danioExplosion = 150

  override method image() = "chad_explosivo.png"

  override method actuar() {}

  override method recibirA(normie) {
    // Al contacto, daña a los enemigos al frente y desaparece del jardín
    normie.recibirDanio(danioExplosion)
    jardin.quitar(self)
  }
}

