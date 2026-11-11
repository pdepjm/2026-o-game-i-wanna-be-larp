import wollok.game.*
import partida_manager.*

object iconoSoles {
  method position() = game.at(0, game.height() - 1)
  method image() = "aura.png"
}

object valorSoles {
  method position() = game.at(1, game.height() - 1)
  method text() = "Aura: " + partida.aura()
  method textColor() = "7544AD"
}

object contadorSoles {
  method mostrar() {
    game.addVisual(iconoSoles)
    game.addVisual(valorSoles)
  }
  method ocultar() {
  game.removeVisual(iconoSoles)
  game.removeVisual(valorSoles)
  }
}