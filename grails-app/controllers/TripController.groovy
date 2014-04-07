import Util

class TripController {

	def create() {
		render(view: 'create')
	}
	
	def save() {
		def currentUser = Util.getCurrentUser()

		def distanceKm = Double.parseDouble(params.distanceKm)
		def startTime = new Date().parse("yyyy-MM-dd'T'HH:mm", params.starttime)
		def trip = new Trip()
		trip.setOwner(currentUser)
		trip.setDistanceKm(distanceKm)
		trip.setStartTime(startTime)
		trip.save()
		currentUser.addToTrips(trip)
		currentUser.save()
		redirect (controller:'dashboard')
	}
	
	def delete() {
		def trip = Trip.get(Integer.parseInt(params.id))
		trip.delete()
		redirect (controller:'dashboard')
	}
}
