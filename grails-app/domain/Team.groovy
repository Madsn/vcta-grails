

class Team {
	
	String name
	
	static belongsTo = [leader: User]
	static hasMany = [members: User]
	static constraints = {
		leader(nullable: true)
		members(nullable: true)
	}
	
	def getTotalKm() {
		float teamTotal = 0
		for (User u in members){
			teamTotal += u.totalKm
		}
		return teamTotal
	}
	
	def beforeValidate = {
		if (members == null)
			members = []
	}
	
	def addMember(User user){
		if (members == null){
			members = [user]
		} else {
			members.add(user)
		}
	}

}
