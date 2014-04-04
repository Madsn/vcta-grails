


class User extends grails.plugin.nimble.core.UserBase {

	float totalKm = 0
	
	static hasMany = [trips: Trip]
	static constraints = {
		trips(nullable: true, blank: true)
	}
	
	def addKm(float km){
		this.totalKm += km
	}
	
	def removeKm(float km){
		this.totalKm -= km
	}
}
