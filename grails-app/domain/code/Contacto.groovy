package code

class Contacto {
    Articulo articulo
    String nombre
    String apellido
    String mail
    String telefono
    Date   fecha
    String pregunta

    static mapping = {
        table 'cntt'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'cntt__id'
            articulo     column: 'artc__id'
            nombre      column: 'cnttnmbr'
            apellido    column: 'cnttapll'
            mail        column: 'cnttmail'
            telefono    column: 'cntttelf'
            fecha       column: 'cnttfcha'
            pregunta    column: 'cnttpreg'
        }
    }


    static constraints = {
        nombre(size: 3..30, blank: false)
        apellido(size: 3..30, blank: false)
        mail(size: 3..63, blank: false)
        telefono(blank: false, attributes: [title: 'teléfono'])
        fecha(blank: false)
        pregunta(size: 4..1023, blank: false)
    }

   String toString(){
       return "${this.nombres} ${this.apellidos} "
   }
}
