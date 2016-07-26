package code

class Usuario {

    String logn
    String pass
    int activo

    static mapping = {
        table 'prsn'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id     column: 'prsn__id'
            logn   column: 'prsnlogn'
            pass   column: 'prsnpass'
            activo column: 'prsnactv'
        }
    }

    static constraints = {
        logn(blank:false,size:4..15)
        pass(blank:false)
        activo(blank:false, nullable:false)
    }

    String toString(){
        return "${this.logn}"
    }
}
