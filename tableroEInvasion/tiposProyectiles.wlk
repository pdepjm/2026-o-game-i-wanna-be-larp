import tableroEInvasion.*
import tableroEInvasion.proyectiles.*


object proyectilComun{

    method crearEn(pos) = (new ProyectilComun(position = pos, danio = 20))

}


object proyectilFuego{


    method crearEn(pos) = new ProyectilFuego(position = pos, danio = 0)


}