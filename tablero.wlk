object tablero{
    var vidas = 3
	const chads = []

    method vidas() = vidas
    method chads() = chads

    method agregarChad(chad) {
        chads.add(chad)
    }

    method eliminarChad(chad) {
        chads.remove(chad)
    }

    method perderVida() {
        vidas -= 1
    }

    method sinVidas() = vidas == 0

}