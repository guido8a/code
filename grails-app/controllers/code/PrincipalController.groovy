package code

class PrincipalController {
    def mailService

    def index() {

        def sitio = Sitio.get(1)
        def secciones = Seccion.findAllBySitio(sitio)

        println("secciones " + secciones)

        return [sitio: sitio, secciones: secciones]

    }

    def enviarMail_ajax () {

//        println("params enviar mail " + params)
        def mailTedein = "informacion@tedein.com.ec"


        try{
            mailService.sendMail {
                to mailTedein
                subject "Nuevo correo desde la página web de TEDEIN"
                body "Pregunta o información: " +
                        "\n Nombre: ${params.nombre} " +
                        "\n Teléfono: ${params.telefono} " +
                        "\n Email: ${params.correo} " +
                        "\n Mensaje: ${params.mensaje}"
            }
            render "ok"
        }catch (e){
            render "no"
             println("Error al enviar el mail")
        }

    }

    def dialogos_ajax () {

        println("params " + params)

        def articulo = Articulo.get(params.id)
        return [art: articulo]

    }

}
