import org.springframework.transaction.annotation.Transactional

@Transactional
class TripService {
	
	void create(Trip trip, User user){
		trip.setOwner(user)
		trip.save()
		user.addToTrips(trip)
		user.save()
	}
	
	void delete(Integer id){
		def trip = Trip.get(id)
		if (trip != null){
			trip.delete()
		}
	}
	
	Trip get(Integer id){
		Trip.get(id)
	}
	
	void delete(Trip trip){
		trip.delete()
	}

}
