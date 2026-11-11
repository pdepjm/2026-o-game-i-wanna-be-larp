import tablero.*
import menuCartas.*
object laPala {
    method image() = "pala.png"
    var property position = game.at(11,game.height())
    var palaSeleccionada = false
    method palaSeleccionada() = palaSeleccionada

    method seleccionarPala() {
        palaSeleccionada = true
    }
    method deseleccionarPala() {
        palaSeleccionada = false
    }
}