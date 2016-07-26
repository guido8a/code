package code

class Sccn {
    Site site
    String nombre
    String descripcion
    int orden

    static mapping = {
        table: 'sccn'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'sccn__id'
            site column: 'site__id'
            nombre column: 'sccnnmbr'
            descripcion column: 'sccndscr'
            orden column: 'sccnordn'
        }
    }


    static constraints = {
        nombre(blank:false,size:4..63)
        orden(blank:false,size:0..2)
    }

   String toString(){
       return "${this.nombre}"
   }
}
