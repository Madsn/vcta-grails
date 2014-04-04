
import User

class Team {
	
	String name
	User leader
	
	static hasMany = [members: User]
	static constraints = {
		leader(nullable: true)
		members(nullable: true)
	}
	
	Double getTotalKm() {
		float teamTotal = 0
		for (User u in members){
			teamTotal += u.getTotalKm()
		}
		return teamTotal
	}

}
