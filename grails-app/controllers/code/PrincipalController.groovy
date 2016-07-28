package code

class PrincipalController {

    def index() {

        def sitio = Sitio.get(1)
        def secciones = Seccion.findAllBySitio(sitio)

        println("secciones " + secciones)

        return [sitio: sitio, secciones: secciones]

    }
}
