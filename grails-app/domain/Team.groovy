
import User

class Team {
	
	String name
	User leader
	
	static hasMany = [members: User, pendingInvitations: Invitation]
	static constraints = {
		leader(nullable: true, blank: true)
		members(nullable: true, blank: true)
		pendingInvitations(nullable: true, blank: true)
	}
	
	Double getTotalKm() {
		float teamTotal = 0
		for (User u in members){
			teamTotal += u.getTotalKm()
		}
		return teamTotal
	}

}
