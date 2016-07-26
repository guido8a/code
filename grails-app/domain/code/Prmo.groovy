package code

class Prmo {
    Sccn sccn
    String nombre
    String texto
    Date   fecha
    String estado

    static mapping = {
        table: 'prmo'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id     column: 'prmo__id'
            sccn   column: 'sccn__id'
            nombre column: 'prmonmbr'
            texto  column: 'prmotxto'
            fecha  column: 'prmofcha'
            estado column: 'prmoetdo'
        }
    }


    static constraints = {
        nombre(blank:false,size:4..63)
        estado(blank:false,size:1..1)
    }

   String toString(){
       return "${this.nombre}"
   }
}
