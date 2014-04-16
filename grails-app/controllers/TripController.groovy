import Util

class TripController {

	def tripService
	def userService
	
	def edit() {
		def trip = tripService.get(Integer.parseInt(params.id))
		render(view: 'edit', model: [trip: trip])
	}
	
	def save() {
		def currentUser = Util.getCurrentUser()

		def distanceKm = Double.parseDouble(params.distanceKm.replaceAll(",", "."))
		def currentYear = Calendar.getInstance().get(Calendar.YEAR)
		def tripDate = new Date(currentYear, 5, Integer.parseInt(params.dayofmonth))
		def trip = new Trip()
		trip.setDistanceKm(distanceKm)
		trip.setDate(tripDate)
		tripService.create(trip, currentUser)
		redirect (controller:'dashboard', params: ['msg': 'Trip added'])
	}
	
	def update() {
		def currentUser = Util.getCurrentUser()
		
		def distanceKm = Double.parseDouble(params.distanceKm.replaceAll(",", "."))
		def currentYear = Calendar.getInstance().get(Calendar.YEAR)
		def tripDate = new Date(currentYear, 5, Integer.parseInt(params.dayofmonth))

		def trip = tripService.get(Integer.parseInt(params.id))
		trip.setDate(tripDate)
		trip.setDistanceKm(distanceKm)
		tripService.update(trip)
		redirect (controller:'dashboard', params: ['msg': 'Trip updated'])
	}
	
	def delete() {
		def currentUser = Util.getCurrentUser()
		def trip = tripService.get(Integer.parseInt(params.id))
		if (currentUser == trip.owner){
			tripService.delete(trip)
		}
		redirect (controller:'dashboard', params: ['msg': 'Trip deleted'])
	}
}
