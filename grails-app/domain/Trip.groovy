
import User

class Trip {

	double distanceKm
	Date startTime

	static belongsTo = [owner: User]

	static mapping = {
	}

	static constraints = {
	}
}
