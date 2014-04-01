class Team {
    String name

    static hasMany = [members: Person]
    static constraints = {
        members nullable: true
    }
}
