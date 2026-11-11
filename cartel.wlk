import menuOpciones.*

object cartel {
  const position = game.at(12, game.height())

  method image() = "pura_calidad.png"

  method position() = position

  method actuar() {
    configuracionAudio.alternarMusica()
  }
}
