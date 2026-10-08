import chads.*




object tipoChadMuro{

     method image() = "murachadfase1.png"

     method crearEn(pos) = new ChadMuro(position = pos,vida = 200,vidaMaxima = 200.0)

}

object tipoChadLanzador{

    method image() = "chadprime.png"

    method crearEn(pos) = new ChadLanzador(position = pos,vida = 100,vidaMaxima = 100.0)


}

object tipoChadOmnisciente{

    method image() = "goat.png"

    method crearEn(pos) = new ChadOmnisciente(position = pos,vida = 100,vidaMaxima = 100.0)

}