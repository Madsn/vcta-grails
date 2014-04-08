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
		def startTime = new Date().parse("yyyy-MM-dd'T'HH:mm", params.starttime)
		def trip = new Trip()
		trip.setDistanceKm(distanceKm)
		trip.setStartTime(startTime)
		tripService.create(trip, currentUser)
		redirect (controller:'dashboard')
	}
	
	def delete() {
		tripService.delete(Integer.parseInt(params.id))
		redirect (controller:'dashboard')
	}
}
