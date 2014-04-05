
import User

class Team extends grails.plugin.nimble.core.Group {

//	String name
	User leader

	static hasMany = [pendingInvitations: Invitation]
	static constraints = {
		leader(nullable: true, blank: true)
//		members(nullable: true, blank: true)
		pendingInvitations(nullable: true, blank: true)
	}

	Double getTotalKm() {
		float teamTotal = 0
		for (u in users){
			teamTotal += u.getTotalKm()
		}
		return teamTotal
	}
	
}
