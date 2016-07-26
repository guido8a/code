package code

class Pscn {
    String nombre

    static mapping = {
        table: 'pscn'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id       column: 'pscn__id'
            nombre   column: 'pscnnmbr'
        }
    }

    static constraints = {
        nombre(blank:false,size:4..31)
    }

   String toString(){
       return "${this.nombre}"
   }
}
