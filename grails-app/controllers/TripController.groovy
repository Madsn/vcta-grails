import Util

class TripController {
	
	def tripService
	def userService

	def create() {
		render(view: 'create')
	}
	
	def save() {
		def currentUser = Util.getCurrentUser()

		def distanceKm = Double.parseDouble(params.distanceKm)
		def tripDate = params.date
		def trip = new Trip()
		trip.setDistanceKm(distanceKm)
		trip.setDate(tripDate)
		tripService.create(trip, currentUser)
		redirect (controller:'dashboard')
	}
	
	def delete() {
		tripService.delete(Integer.parseInt(params.id))
		redirect (controller:'dashboard')
	}
}
