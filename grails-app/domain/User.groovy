
class User extends grails.plugin.nimble.core.UserBase {

	Team team

	static hasMany = [trips: Trip, invitations: Invitation]
	
	static constraints = {
		trips(nullable: true, blank: true)
		team(nullable: true, blank: true)
		invitations(nullable: true, blank: true)
	}
	
	static mapping = {
		table '`user`'
	}

	Double getTotalKm() {
		double totalkm = 0
		trips.each {
			totalkm += it.getDistanceKm()
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
	
	public String toString() {
		String user = username
		if (this.profile?.fullName){
			user += " - " + this.profile.fullName
		}
		return user
	}
}
