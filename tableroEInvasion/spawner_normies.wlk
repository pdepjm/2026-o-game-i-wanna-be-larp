import chadsYNormies.normies.*
import archivo_jardin.*
import chadsYNormies.tiposNormies.*
import archivo_invasion.*

object spawnerDeNormies{

    const normiesDisponibles = [tipoNormieComun]

    method posRandom() = game.at(12,self.yRandom())

    method yRandom() = new Range(start = 0,end = jardin.limiteAltoJardin()).anyOne()

    method spawnearNormie(){

        invasion.agregar(self.normieNuevo())


    }

    method normieNuevo() = (normiesDisponibles.anyOne()).crearEn(self.posRandom())

    


}



