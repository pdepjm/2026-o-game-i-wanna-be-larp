import chadsYNormies.normies.*
import archivo_jardin.*
import chadsYNormies.tiposNormies.*
import archivo_invasion.*

object spawnerDeNormies{

    const normiesDisponibles = [tipoNormieComun,tipoNormieRapido]

    method posRandom() = game.at(12,self.yRandom())

    method yRandom() = new Range(start = 0,end = jardin.limiteAltoJardin()).anyOne()


    method habilitarSpawner(){

             game.onTick(10000,"spawnear normies",{
            self.spawnearNormie()

  })        

    }

   method deshabilitarSpawner() {
    try { game.removeTickEvent("spawnear normies") } catch e : Exception {}
  }


    method spawnearNormie(){


        invasion.agregar(self.normieNuevo())


    }

    method normieNuevo() = (normiesDisponibles.anyOne()).crearEn(self.posRandom())

    


}



