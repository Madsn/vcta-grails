
import User

class Team extends grails.plugin.nimble.core.Group {

	User leader

	static hasMany = [pendingInvitations: Invitation]
	static constraints = {
		leader(nullable: true, blank: true)
		pendingInvitations(nullable: true, blank: true)
	}

	Double getTotalKm() {
		float teamTotal = 0
		for (u in users){
			teamTotal += u.getTotalKm()
		}
		return teamTotal
	}
	
	Integer getCyclingDays() {
		int teamTotal = 0
		users.each {
			teamTotal += it.getCyclingDays()
		}
		return teamTotal
	}
	
}
