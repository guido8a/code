package code

class Articulo {
    Seccion seccion
    Layout layout
    String titulo
    String subtitulo
    String descripcion
    String texto
    Date fecha
    String imagen
    String metaDescripcion
    String estado
    int orden

    static mapping = {
        table 'artc'
        cache usage:'read-write', include:'non-lazy'
        id generator:'identity'
        version false
        columns {
            id              column: 'artc__id'
            seccion         column: 'sccn__id'
            layout          column: 'layt__id'
            titulo          column: 'artctitl'
            subtitulo       column: 'artcsbtt'
            descripcion     column: 'artcdscr'
            texto           column: 'artctxto'
            fecha           column: 'artcfcha'
            imagen          column: 'artcimgn'
            metaDescripcion column: 'artcmtpg'
            estado          column: 'artcetdo'
        }
    }
    static constraints = {
        titulo(blank:false, size: 3..255)
        subtitulo(blank:false, size: 3..255)
        descripcion(blank:false, size: 3..1023)
        texto(blank:false)
        imagen(blank:true, size: 0..255)
        metaDescripcion(blank:false, size: 0..255)
        estado(size:1..1, blank:false)
    }

    String toString(){
    	"${this.nombre}"
    }
}
