import wollok.game.*
import cartel.*

object pantallaOpciones {
  method position() = game.at(0, 0)
  method image() = "MenuDeOpciones.png"
}

// Configuración de audio
object configuracionAudio {
  const musica = game.sound("musica.mp3")
  
  var musicaActiva = false
  var musicaPorcentaje = 50
  var efectosPorcentaje = 50

  method volumenMusica() = musicaPorcentaje
  method volumenEfectos() = efectosPorcentaje

  method bajarMusica() {
    if (musicaPorcentaje > 0) {
      musicaPorcentaje -= 10
      musica.volume(musicaPorcentaje / 100.0)
    }
  }

  method subirMusica() {
    if (musicaPorcentaje < 100) {
      musicaPorcentaje += 10
      musica.volume(musicaPorcentaje / 100.0)
    }
  }

  method bajarEfectos() {
    if (efectosPorcentaje > 0) {
      efectosPorcentaje -= 10
    }
  }

  method subirEfectos() {
    if (efectosPorcentaje < 100) {
      efectosPorcentaje += 10
    }
  }

  method alternarMusica() {
    musica.shouldLoop(true)

    if (!musicaActiva) {
      musica.volume(musicaPorcentaje / 100.0)
      musica.play()
      musicaActiva = true
    } else {
      musica.stop()
      musicaActiva = false
    }
  }

  method reproducirEfecto(archivo) {
    const efecto = game.sound(archivo)
    efecto.volume(efectosPorcentaje / 100.0)
    efecto.play()
  }
}

// Porcentaje de música
object valorMusica {
  method position() = game.at(7, 3)
  method text() = "" + configuracionAudio.volumenMusica() + "%"
  method textColor() = "FFFFFF"
}

// Porcentaje de efectos
object valorEfectos {
  method position() = game.at(6, 2)
  method text() = "" + configuracionAudio.volumenEfectos() + "%"
  method textColor() = "FFFFFF"
}