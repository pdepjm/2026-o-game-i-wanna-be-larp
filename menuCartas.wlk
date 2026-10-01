import chads.*


class Carta{
   //clase que representa las cartas a utilizar en el menu de selección de cartas
    var chadQueRepresenta
    
    var image

    var position

    method image() = image

    method position() = position

    method chadQueRepresenta() = chadQueRepresenta

    method init(chad, posicion, imagen){

        chadQueRepresenta = chad

        position = posicion

        image = imagen
    }



}

object generadorDeCartas{

    //genera las cartas en base a los chads que se hayan seleccionado
    const chadsDisponibles = []
        
    var posXDeCartas = 3


       method crearCartas(chadsSeleccionados) {
        chadsSeleccionados.forEach({ chad =>
            
            const cartaNueva = new Carta(
                chadQueRepresenta = chad,
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

    const chadLanzadorPrueba = new ChadLanzador(position = game.at(5,4),vida = 150, vidaMaxima = 150.0)

    const chadNuezPrueba1 = new ChadMuro(position = game.at(5,4),vida = 200, vidaMaxima = 200.0)
    

    const chadsSeleccionados = [chadNuezPrueba1,chadLanzadorPrueba]  

    //esto es algo de prueba, en caso de querer agregar mas cartas al menu, agregarlas acá

    const cartasDisponibles = generadorDeCartas.crearCartas(chadsSeleccionados)

    method cartasDisponibles() = cartasDisponibles

    method mostrarMenu(){

      cartasDisponibles.forEach({cartaChad => game.addVisual(cartaChad)})


    }

    method hayCartaEn(posicion) = cartasDisponibles.any({chad => chad.position() == posicion}) 

    method chadEn(posicion) = cartasDisponibles.find({chad => chad.position() == posicion})


}

