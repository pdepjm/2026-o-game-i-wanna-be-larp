
object zombie1{

    const x = game.width()
    const y = 0.randomUpTo(game.height())
    
    var property position = game.at(x,y) 

    method posicion() = position

    method velocidad() = 1

    method image() = "goat.png"


    method mover(){

        position = position.left(self.velocidad())


    }




}

object zombie2{

    
    const x = game.width()
    const y = 0.randomUpTo(game.height())
    
    var property position = game.at(x,y) 

    method posicion() = position

    method velocidad() = 2

    method image() = "pepita.jpg"

    method mover(){

        position = position.left(self.velocidad())


    }



}