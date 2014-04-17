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

		def today = new Date()
		def distanceKm = Double.parseDouble(params.distanceKm.replaceAll(",", "."))
		def currentYear = Calendar.getInstance().get(Calendar.YEAR)
		def tripDate = new Date(currentYear, 5, Integer.parseInt(params.dayofmonth) % 31)
		def trip = new Trip()
		trip.setDistanceKm(distanceKm)
		trip.setDate(tripDate)
		if (today.month == 5 && tripDate > today.date){
			redirect (controller:'dashboard', params: ['error': "Please don\'t create trips ahead of time"])
			return
		} else {
			tripService.create(trip, currentUser)
			redirect (controller:'dashboard', params: ['msg': 'Trip added'])
		}
	}
	
	def update() {
		def currentUser = Util.getCurrentUser()
		
		def distanceKm = Double.parseDouble(params.distanceKm.replaceAll(",", "."))
		def currentYear = Calendar.getInstance().get(Calendar.YEAR)
		def tripDate = new Date(currentYear, 5, Integer.parseInt(params.dayofmonth) % 31)

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
