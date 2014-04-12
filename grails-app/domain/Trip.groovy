
import User

class Trip {

	double distanceKm
	Date date

	static belongsTo = [owner: User]

	static mapping = {
	}

	static constraints = {
	}
}
