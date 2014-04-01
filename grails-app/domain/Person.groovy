class Person {
    String name
    Team team

    static constraints = {
        team nullable: true
    }

    String toString() {
        return "Person " + id + ": " + name
    }
}
