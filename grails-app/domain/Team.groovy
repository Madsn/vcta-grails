class Team {
    String teamName

    static hasMany = [ members : Person ]
    static mapping = {
        members lazy: true
    }
}
