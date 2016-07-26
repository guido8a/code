package code

class Site {
    String nombre
    String descripcion

    static mapping = {
        table: 'site'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'site__id'
            nombre      column: 'sitenmbr'
            descripcion column: 'sitedscr'
        }
    }

    static constraints = {
        nombre(blank:false,size:4..63)
        descripcion(blank:false,size:0..255)
    }

    String toString(){
        return "${this.nombre}"
    }
}
