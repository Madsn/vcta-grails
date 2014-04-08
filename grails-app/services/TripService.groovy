import org.springframework.transaction.annotation.Transactional

@Transactional
class TripService {
	
	def userService
	
	void create(Trip trip, User user){
		trip.setOwner(user)
		userService.addToTrips(trip, user)
		trip.save()
	}
	
	void delete(Integer id){
		def trip = Trip.get(id)
		if (trip != null){
			trip.delete()
		}
	}

}
