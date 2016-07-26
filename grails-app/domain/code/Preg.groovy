package code

class Preg {
    Sccn sccn
    Date   fecha
    String pregunta
    String respuesta
    String estado

    static mapping = {
        table: 'preg'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id        column: 'preg__id'
            sccn      column: 'sccn__id'
            fecha     column: 'pregfcha'
            pregunta  column: 'pregtxto'
            respuesta column: 'pregresp'
            estado    column: 'pregetdo'
        }
    }


    static constraints = {
        pregunta(blank:false,size:10..1023)
        estado(blank:false,size:1..1)
    }

   String toString(){
       return "${this.pregunta}"
   }
}
