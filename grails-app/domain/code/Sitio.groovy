package code

class Sitio {
    String nombre
    String descripcion
    String estado

    static mapping = {
        table 'site'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'site__id'
            nombre      column: 'sitenmbr'
            descripcion column: 'sitedscr'
            estado      column: 'siteetdo'
        }
    }

    static constraints = {
        nombre(blank:false,size:4..63)
        descripcion(blank:false,size:0..255)
        estado(blank:false, inList: ["A", "N"])
    }

    String toString(){
        return "${this.nombre}"
    }
}
