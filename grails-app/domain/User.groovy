
class User extends grails.plugin.nimble.core.UserBase {

	Team team

	static hasMany = [trips: Trip, invitations: Invitation]
	
	static constraints = {
		trips(nullable: true, blank: true)
		team(nullable: true, blank: true)
		invitations(nullable: true, blank: true)
	}

	Double getTotalKm() {
		double totalkm = 0
		for (Trip t in trips){
			totalkm += t.getDistanceKm()
		}
		return totalkm
	}
	
	Integer getCyclingDays() {
		if (trips == null){
			return 0
		} else {
			trips.groupBy({trip -> trip.date}).size()
		}
	}
}
