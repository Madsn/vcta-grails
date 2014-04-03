


class User extends grails.plugin.nimble.core.UserBase {

	static hasMany = [trips: Trip]
	static constraints = {
		trips(nullable: true, blank: true)
	}
}
