

class User extends grails.plugin.nimble.core.UserBase {

	Team team

	static hasMany = [trips: Trip]
	
	static constraints = {
		trips(nullable: true, blank: true)
		team(nullable: true, blank: true)
	}

	double getTotalKm() {
		double totalkm = 0
		for (Trip t in trips){
			totalkm += t.getDistanceKm()
		}
		return totalkm
	}
}
