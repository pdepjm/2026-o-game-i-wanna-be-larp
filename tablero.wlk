import zombies.*




object spawner{

    const listaZombies = [zombie1,zombie2]   

    method spawnearZombie(){

        var zombieAlAzar = listaZombies.anyOne()


        game.addVisual(zombieAlAzar)

        return zombieAlAzar

    }




}