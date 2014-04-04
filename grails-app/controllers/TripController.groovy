import org.apache.shiro.SecurityUtils

class TripController {

	def create() {
		render(view: 'create')
	}
	
	def savetrip() {
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())
		println params
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
	
	def deletetrip() {
		def trip = Trip.get(Integer.parseInt(params.id))
		trip.delete()
		redirect (controller:'dashboard')
	}
}
