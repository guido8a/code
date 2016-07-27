package code

class Layout {
    String codigo
    String descripcion

    static mapping = {
        table 'layt'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'layt__id'
            codigo      column: 'laytnmbr'
            descripcion column: 'laytdscr'
        }
    }


    static constraints = {
        codigo(blank:false,size:4..7)
        descripcion(blank:false,size:0..255)
    }

   String toString(){
       return "${this.codigo}: ${this.descripcion}"
   }
}
