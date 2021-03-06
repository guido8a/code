package code

class Articulo {
    Seccion seccion
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

            titulo          column: 'artctitl'
            subtitulo       column: 'artcsbtt'
            descripcion     column: 'artcdscr'
            texto           column: 'artctxto'
            fecha           column: 'artcfcha'
            imagen          column: 'artcimgn'
            metaDescripcion column: 'artcmeta'
            estado          column: 'artcetdo'
            orden           column: 'artcordn'
        }
    }
    static constraints = {
        titulo(blank:false, size: 3..255)
        subtitulo(blank:false, size: 3..255)
        descripcion(blank:false, size: 3..1023)
        texto(blank:false)
        imagen(blank:true, nullable: true, size: 0..255)
        metaDescripcion(blank:false, size: 0..255)
        estado(size:1..1, inList: ["A", "P"])
    }

    String toString(){
    	"${this.nombre}"
    }
}
