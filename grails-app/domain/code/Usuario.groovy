package code

class Usuario {

    String nombre
    String apellido
    String titulo
    String mail
    String telefono
    Date   fecha
    String sexo
    String activo
    String login
    String password

    static mapping = {
        table 'prsn'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id       column: 'prsn__id'
            nombre   column: 'prsnnmbr'
            apellido column: 'prsnapll'
            titulo   column: 'prsntitl'
            mail     column: 'prsnmail'
            telefono column: 'prsntelf'
            fecha    column: 'prsnfcha'
            sexo     column: 'prsnsexo'
            activo   column: 'prsnactv'
            login    column: 'prsnlogn'
            password column: 'prsnpass'
        }
    }

    static constraints = {
        nombre(size: 3..30, blank: false)
        apellido(size: 3..30, blank: false)
        titulo(size: 3..4, blank: true)
        mail(size: 3..63, blank: false)
        telefono(blank: false, attributes: [title: 'teléfono'])
        fecha(blank: false)
        sexo(inList: ["F", "M"], size: 1..1, blank: false, attributes: ['mensaje': 'Sexo de la persona'])
        activo(blank: false, attributes: [title: 'activo'])
        login(size: 4..15, blank: false, unique: true)
        password(blank: false)
    }

    String toString(){
        return "${this.nombre} ${this.apellido}"
    }
}
