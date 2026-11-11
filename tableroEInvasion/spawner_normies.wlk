import wollok.game.*
import chadsYNormies.normies.*
import archivo_jardin.*
import chadsYNormies.tiposNormies.*
import archivo_invasion.*

object spawnerDeNormies{
    var ratio = 15000
    var segundosPasados = 0

    const normiesDisponibles = [tipoNormieComun,tipoNormieRapido]

    method posRandom() = game.at(12,self.yRandom())

    method yRandom() = new Range(start = 0,end = jardin.limiteAltoJardin()).anyOne()


    method habilitarSpawner(){

        game.onTick(ratio,"spawnear normies",{
        self.spawnearNormie()
        self.actualizarRatio()
        self.deshabilitarSpawner()     
        console.println(ratio)
        console.println(segundosPasados)
        game.schedule(ratio, self.habilitarSpawner())

        
      }) 
    }       
    
    method deshabilitarSpawner() {
      try { game.removeTickEvent("spawnear normies") } catch e : Exception {}
    }

    method actualizarRatio(){
       ratio = 300000/(segundosPasados*0.2+20)      
    }

    method reiniciarRatio(){
      ratio = 15000
      segundosPasados = 0
    }
    
    method pasarSegundo(){
      segundosPasados+=1
    }
    
   method deshabilitarSpawner() {
    try { game.removeTickEvent("spawnear normies") } catch e : Exception {}
  }


    method spawnearNormie(){
        invasion.agregar(self.normieNuevo())
    }
    method normieNuevo() = (normiesDisponibles.anyOne()).crearEn(self.posRandom())
}



