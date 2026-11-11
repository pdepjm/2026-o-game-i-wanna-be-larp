import tableroEInvasion.proyectiles.*
import chads.*
import tableroEInvasion.tiposProyectiles.*

//archivo para la definicion de stats de los chads


object tipoChadMuro{
    method costo() = 50
    method image() = "murachadfase1.png"

    method crearEn(pos) = new ChadMuro(position = pos,vida = 200,vidaMaxima = 200.0)

}

object tipoChadLanzador{
    method costo() = 100
    method image() = "chadprime.png"

    method crearEn(pos) = new ChadLanzador(proyectilQueUsa = proyectilFuego, position = pos,vida = 100,vidaMaxima = 100.0)


}





object tipoChadOmnisciente {
  method costo() = 50
  method image() = "chad_omnisciente.png"

  method crearEn(pos) = new ChadOmnisciente(
    position = pos,
    vida = 100,
    vidaMaxima = 100.0,
    recursosGenerados = 25
  )
} 

object tipoChadExplosivo {
  method costo() = 150 // o el costo asignado si lo usan en la carta
  method image() = "chad_explosivo.png"

  method crearEn(pos) = new ChadExplosivo(
    position = pos,
    vida = 1,
    vidaMaxima = 1.0
  )
}

