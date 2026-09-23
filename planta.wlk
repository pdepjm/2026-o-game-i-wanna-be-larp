object planta{

    var property position = game.at(0, 0) 
    
    method image() = "chadprime.png"

    method colocar(x,y){

        position = game.at(x, y)
        game.addVisual(self)        
        
    }
    
    method cambiarPosicion(){

        position = position.up(1)


    }
       


}