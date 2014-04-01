class Team {
    String name
    Person leader

    static hasMany = [members: Person]
    static constraints = {
        members nullable: true
        leader nullable: false
    }
}
