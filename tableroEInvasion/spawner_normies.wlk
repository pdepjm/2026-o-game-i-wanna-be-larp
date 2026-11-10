import chadsYNormies.normies.*
import archivo_jardin.*
import chadsYNormies.tiposNormies.*
import archivo_invasion.*

object spawnerDeNormies{
    var ratio = 15000
    const normiesDisponibles = [tipoNormieComun,tipoNormieRapido]

    method posRandom() = game.at(12,self.yRandom())

    method yRandom() = new Range(start = 0,end = jardin.limiteAltoJardin()).anyOne()


    method habilitarSpawner(){
         game.onTick(ratio,"spawnear normies",{
         self.spawnearNormie()
         self.actualizarRatio()
         console.println(ratio)
         game.removeTickEvent("spawnear normies")       
         game.schedule(ratio, self.habilitarSpawner())
        })
        
    }
    
    method actualizarRatio(){
       ratio = 300000/(game.currentTime()*0.0002+20)
    }
    method spawnearNormie(){

        invasion.agregar(self.normieNuevo())

    }

    method normieNuevo() = (normiesDisponibles.anyOne()).crearEn(self.posRandom())

    


}



