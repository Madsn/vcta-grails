import Util

class TripController {

	def tripService
	def userService
	
	def beforeInterceptor = [action: this.&frozenInterceptor]
	
	private frozenInterceptor(){
		if (SettingsController.frozen()){
			redirect(controller:'dashboard', params: ['error': 'Entry of trips has been frozen by admin.'])
			return false
		}
	}
	
	def edit() {
		def trip = tripService.get(Integer.parseInt(params.id))
		render(view: 'edit', model: [trip: trip])
	}
	
	def save() {
		def currentUser = Util.getCurrentUser()
		def dayOfMonth = Integer.parseInt(params.dayofmonth)
		if (params.distanceKm == ""){
			redirect (controller:'dashboard', params: ['error': "Invalid distance"])
			return
		} else if (dayOfMonth > 31 || dayOfMonth < 1) {
			redirect (controller:'dashboard', params: ['error': "Invalid day of month"])
			return
		}
		
		def distanceKm = Double.parseDouble(params.distanceKm.replaceAll(",", "."))
		if (distanceKm <= 0 || distanceKm > 300){
			redirect (controller:'dashboard', params: ['error': "Unlikely or invalid distance"])
			return
		}
		Calendar cal = Calendar.getInstance();
		def tripDate = new Date(cal.get(Calendar.YEAR), 5, dayOfMonth)
		Calendar tripCal = Calendar.getInstance()
		tripCal.setTime(tripDate)
		def trip = new Trip()
		trip.setDistanceKm(distanceKm)
		trip.setDate(tripDate)
		if (tripCal.get(Calendar.DATE) > cal.get(Calendar.DATE) && cal.get(Calendar.MONTH) == Calendar.MAY){
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
