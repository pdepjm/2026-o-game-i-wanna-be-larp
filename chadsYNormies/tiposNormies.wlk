import normies.*

//archivo para la definicion de stats de los normies

object tipoNormieComun{

    method crearEn(pos) = new NormieComun(tiempoQueRecorreUnaCasillaEnMs = 2500,position = pos,vida = 100,danio = 20)

}


object tipoNormieRapido {
  method crearEn(pos) = new NormieComun(tiempoQueRecorreUnaCasillaEnMs = 1000,position = pos, vida = 50, danio = 10)
}


object tipoNormieTanque {
  method crearEn(pos) = new NormieTanque(tiempoQueRecorreUnaCasillaEnMs = 3500,position = pos, vida = 250, danio = 40)
}
