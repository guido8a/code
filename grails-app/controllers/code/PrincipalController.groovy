package code

class PrincipalController {
    def mailService

    def index() {

        def sitio = Sitio.get(1)
        def secciones = Seccion.findAllBySitio(sitio, [sort: 'orden', order: 'asc'])

//        println("secciones " + secciones)

        def quanto = Articulo.findAllBySeccion(Seccion.get(3))

        return [sitio: sitio, secciones: secciones, quanto: quanto]

    }

    def enviarMail_ajax () {

//        println("params enviar mail " + params)
        def mailTedein = "informacion@tedein.com.ec"
        def mailTedein2 = "guido8a@gmail.com"
        def errores = ''


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
//            render "ok"
        }catch (e){
//            render "no"
             println("Error al enviar el mail")
            errores += e
        }

        try{
            mailService.sendMail {
                to mailTedein2
                subject "Nuevo correo desde la página web de TEDEIN"
                body "Pregunta o información: " +
                        "\n Nombre: ${params.nombre} " +
                        "\n Teléfono: ${params.telefono} " +
                        "\n Email: ${params.correo} " +
                        "\n Mensaje: ${params.mensaje}"
            }
//            render "ok"
        }catch (e){
//            render "no"
            println("Error al enviar el mail 2")
            errores += e
        }

        if(errores == ''){
            render "ok"
        }else{
            render "no"
        }



    }

    def dialogos_ajax () {
        def articulo = Articulo.get(params.id)
        return [art: articulo]

    }

}
