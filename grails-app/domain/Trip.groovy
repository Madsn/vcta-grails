

class Trip {

	private float distanceKm = 0
	Date startTime

	static belongsTo = [owner: User]

	static mapping = {
	}

	static constraints = {
	}

	def init = { owner.addKm(distanceKm) }

	def delete = { owner.removeKm(distanceKm) }

	def changeKm(float newKm){
		if (newKm > distanceKm){
			owner.addKm(newKm - distanceKm)
		} else {
			owner.removeKm(distanceKm - newKm)
		}
		distanceKm = newKm
	}

	def getKm() {
		return distanceKm
	}
	
	def delete() {
		owner.removeKm(distanceKm)
	}
}
