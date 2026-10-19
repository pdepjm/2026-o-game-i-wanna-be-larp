object cartel{

    const position = game.at(12, game.height())
    var musicaActiva = false
    const musica = game.sound("musica.mp3")
    

    method image() = "pura_calidad.png"

    method position() = position


    


    method actuar(){
        
        musica.shouldLoop(true)    

        if(!musicaActiva){

            
            musica.play()
            musicaActiva = true

        }else{

            musica.stop()
            musicaActiva = false

        }
        

    }


}

