package code

class Cntt {
    Site site
    String nombres
    String apellidos
    String titulo
    String universidad
    String mail
    String telefono
    Date   fecha
    String genero
    String estado
    String comentario

    static mapping = {
        table: 'cntt'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id          column: 'cntt__id'
            site        column: 'site__id'
            nombres     column: 'cnttnmbr'
            apellidos   column: 'cnttapll'
            universidad column: 'cnttuniv'
            mail        column: 'cnttmail'
            telefono    column: 'cntttelf'
            fecha       column: 'cnttfcha'
            genero      column: 'cnttsexo'
            estado      column: 'cnttetdo'
            comentario  column: 'cntttxto'
        }
    }


    static constraints = {
        nombres(blank:false,size:3..31)
        apellidos(blank:false,size:3..31)
        estado(blank:false,size:1..1)
    }

   String toString(){
       return "${this.nombres} ${this.apellidos} "
   }
}
