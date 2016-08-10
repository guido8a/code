package code

class Shield {
    def beforeInterceptor = [action:this.&auth,except:'login']
    /**
     * Verifica si se ha iniciado una sesión
     * Verifica si el usuario actual tiene los permisos para ejecutar una acción
     */
    def auth() {
        if(!session.usuario){
            redirect(controller:'login',action:'login')
            session.finalize()
            return false
        } else {
            //verificacion de permisos
            //println "acceso permitido"
            return true
        }
    }       
}
 
