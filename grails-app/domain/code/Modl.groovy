package code

class Modl {
    Pscn posicion
    String nombre
    String texto
    int orden

    //static hasMany = [posiciones: Pscn, secciones: Sccn]

    static mapping = {
        table: 'modl'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id       column: 'modl__id'
            posicion column: 'pscn__id'
            nombre   column: 'modlnmbr'
            texto    column: 'modltxto'
            orden    column: 'modlordn'
        }
    }


    static constraints = {
        nombre(blank:false,size:4..31)
        orden(blank:false,size:0..2)
    }

   String toString(){
       return "${this.nombre}"
   }
}
