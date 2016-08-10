package code

class LoginController {

    def fecha = Calendar.instance
    def rand = new Random(fecha.time.time)
    def token = rand.nextInt().toString().encodeAsMD5()


    def index = { redirect(action: "login") }

    def login() {
        def usu = session.usuario
        def cn = "articulo"
        def an = "lista"

        if (usu) {
            redirect(controller: cn, action: an)
        }
//        println "token: $token"
        [token: token]
    }


    def validar() {
        if (request.method == 'POST' && token == params.auth_tk) {
//            println "----------llega:" + params
            def user = ""
            def pass = ""
            //println "decodificado: ${pass}"
            if (params.user && params.pass) {
                user = params.user
//                pass = decodifica(params.password)
                pass = params.pass.toString().encodeAsMD5()
                println "usuario: ${user} password: ${pass}"
                def usuario = Usuario.findWhere(login: user, password: pass, activo: 'A')
                println "---> usuario: ${usuario}"
                if (usuario) {
                    session.usuario = usuario
                    redirect(controller: 'articulo', action: 'lista')
                } else {
                    flash.message = "Usuario o contraseña inválidos"
                    redirect(action: "login")
                }
            }
        }  else {
            session.usuario = null
            redirect(controller: "principal", action: "index")
        }
    }

    def logout = {
        if (session.usuario) {
            session.usuario = null
        }
        redirect(controller: "principal", action: "index")
    }

    String codifica(tx) {
        // mejor poner letras en luhar de numeros: del 1 al 10: as ed ft bn jk
        def letras = ['a', 's', 'e', 'd', 'f', 't', 'b', 'n', 'j', 'k']
        def nm = ""
        def nn = ""
        def i = 0
        //println nmro
        while (i < 20) {
            nn = tx[i].toInteger() + tx[i + 1].toInteger()
            //print nn
            if (nn >= 10) {
                nm += letras[(nn - 10)]
            } else nm += letras[nn]
            //print "->" + nn + "nm:" + nm
            i += 2
        }
        //println "Resutado" + nm
        return nm
    }

    String decodifica(tx) {
        def salida = tx[0..-(session.semilla.length() + 1)]
        return salida
    }


}
