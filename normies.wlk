class Normie{
	
	var property position

	method image() = "normieNormal.png" 

	method avanzar(){
		position = position.left(1)
	}

    method llegoAlFinal() = position.x() == 0

	




}