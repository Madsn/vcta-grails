
import User

class Team extends grails.plugin.nimble.core.Group {

	User leader

	static hasMany = [pendingInvitations: Invitation]
	static constraints = {
		leader(nullable: true, blank: true)
		pendingInvitations(nullable: true, blank: true)
	}
	
	Integer getUserCount() {
		return this.users.size()
	}

	Double getTotalKm() {
		float teamTotal = 0
		users.each {
			teamTotal += it.getTotalKm()
		}
		return Math.round(teamTotal * 100) / 100
	}
	
	Double getAverageKm() {
		return getTotalKm() / getUserCount()
	}
	
	Integer getCyclingDays() {
		int teamTotal = 0
		users.each {
			teamTotal += it.getCyclingDays()
		}
		return teamTotal
	}
	
	Double getAverageCyclingDays() {
		int teamTotal = getCyclingDays()
		return teamTotal/getUserCount()
	}
	
}
