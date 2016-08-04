package code

class Seccion {
    Sitio sitio
    Layout layout
    String menu
    String titulo
    String subtitulo
    int orden
    String estado
    String imagen

    static mapping = {
        table 'sccn'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'sccn__id'
            sitio column: 'site__id'
            layout column: 'layt__id'
            menu column: 'sccnmenu'
            titulo column: 'sccntitl'
            subtitulo column: 'sccnsbtt'
            orden column: 'sccnordn'
            estado column: 'sccnetdo'
            imagen column: 'sccnimgn'
        }
    }


    static constraints = {
        menu(blank:false,size:1..63)
        titulo(blank:true,size:0..255)
        subtitulo(blank:true,size:0..255)
        orden(blank:false)
        estado(blank:false, inList: ["A", "N"])
        estado(blank:true, size:0..255)
    }

   String toString(){
       return "${this.titulo}"
   }
}
