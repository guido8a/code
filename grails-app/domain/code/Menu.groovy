package code

class Menu {
    Sccn seccion
    Artc pagina
    String nombre
    String url
    int orden

    //static hasMany = [articulos: Artc, secciones: Sccn]

    static mapping = {
        table: 'menu'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id       column: 'menu__id'
            seccion  column: 'sccn__id'
            pagina   column: 'artc__id'
            nombre   column: 'menunmbr'
            url      column: 'menu_url'
            orden    column: 'menuordn'
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
