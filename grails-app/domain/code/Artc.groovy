package code

class Artc {
    String nombre
    String texto
    Date fecha
    String imagen
    String imagenDiv
    String metaDescripcion
    String metaPalabrasClave
    String estado

    static mapping = {
        table 'artc'
        cache usage:'read-write', include:'non-lazy'
        id generator:'identity'
        version false
        columns {
            id                column: 'artc__id'
            nombre            column: 'artcnmbr'
            texto             column: 'artctxto'
            fecha             column: 'artcfcha'
            imagen            column: 'artcimgn'
            imagenDiv         column: 'artcimdv'
            metaDescripcion   column: 'artcmtpg'
            metaPalabrasClave column: 'artmtpl'
            estado            column: 'artcetdo'
        }
    }
    static constraints = {
        nombre(blank:false)
        texto(blank:false)
        estado(size:1..1, blank:false)
    }

    String toString(){
    	"${this.nombre}"
    }
}
