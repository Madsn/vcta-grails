class Team {
    String name
    User leader

    static hasMany = [members: User]
    static constraints = {
        members nullable: true
        leader nullable: false
    }

    String toString() {
        return "Team " + id + ": " + name
    }
}
