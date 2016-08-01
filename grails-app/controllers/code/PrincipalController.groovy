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

        println("params enviar mail " + params)
        def mailTedein = "informacion@tedein.com.ec"



        try{
            mailService.sendMail {
                to mailTedein
                subject "Nuevo correo desde la página web de TEDEIN"
                body "Pregunta/información </br> Nombre: ${params.nombre} </br> Teléfono: ${params.telefono} </br> Email: ${params.correo} </br> Mensaje: ${params.mensaje}"
            }
            render "ok"
        }catch (e){
            render "no"
             println("Error al enviar el mail")
        }


    }

}
