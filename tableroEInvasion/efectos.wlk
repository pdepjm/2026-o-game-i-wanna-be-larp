import chadsYNormies.normies.*


object fuego{

    const tiempoQuemadura = 500   
    const danioQuemadura = 10
    const duracionQuemadura = 2000

    method quemarNormie(normie){

        const quemadura = game.tick(tiempoQuemadura,{normie.recibirDanio(danioQuemadura)},false)
        quemadura.start()

        game.schedule(duracionQuemadura, {quemadura.stop()})

    }


}