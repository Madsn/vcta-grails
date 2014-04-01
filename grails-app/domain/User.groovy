


class User extends grails.plugin.nimble.core.UserBase {

	// Extend UserBase with your custom values here

    Team team

    static constraints = {
        team nullable: true
    }

    String toString() {
        return "Person " + id + ": " + name
    }
}
