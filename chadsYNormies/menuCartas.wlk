import chadsYNormies.chads.*
import chadsYNormies.tiposChads.*

class Carta{
   //clase que representa las cartas a utilizar en el menu de selección de cartas
    
    const image

    const position

    const tipoChad

    method costo() = tipoChad.costo()

    method image() = image
    method esCarta() = true
    method position() = position

    method crearChadEn(pos){

        return tipoChad.crearEn(pos)

    }


}

object sinCartaElegida {
  method esCarta() = false
  method costo() = 0
}


object generadorDeCartas{

    //genera las cartas en base a los chads que se hayan seleccionado
    const chadsDisponibles = []
         
    var posXDeCartas = 3


       method crearCartas(chadsSeleccionados) {
        chadsSeleccionados.forEach({ chad =>
            
            const cartaNueva = new Carta(
                tipoChad = chad,
                image = chad.image(),
                position = game.at(posXDeCartas, 5)
            )

            chadsDisponibles.add(cartaNueva)
            posXDeCartas = posXDeCartas + 1
        })

        return chadsDisponibles

    }


}
object menuDeCartas{

    method posXCartas() = 5
    var menuMostrado = false

    const chadsSeleccionados = [
        tipoChadLanzador,
        tipoChadMuro,
        tipoChadOmnisciente
    ]  

    //esto es algo de prueba, en caso de querer agregar mas cartas al menu, agregarlas acá

    const cartasDisponibles = generadorDeCartas.crearCartas(chadsSeleccionados)

    method cartasDisponibles() = cartasDisponibles

    method mostrarMenu() {
        if (!menuMostrado) {
            cartasDisponibles.forEach({ cartaChad =>
                game.addVisual(cartaChad)
            })
            menuMostrado = true
        }

        
    }

    method hayCartaEn(posicion) = cartasDisponibles.any({chad => chad.position() == posicion}) 

    method chadEn(posicion) = cartasDisponibles.findOrDefault({ chad => chad.position() == posicion },
    sinCartaElegida
    )

    method reiniciar() {
    menuMostrado = false
  }

}