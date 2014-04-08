import org.springframework.transaction.annotation.Transactional

@Transactional
class UserService extends grails.plugin.nimble.core.UserService {

	void setTeam(Team team, User user){
		user.team = team
		user.save()
	}

	void removeFromInvitations(Invitation invitation){
		def user = invitation.invitee
		user.removeFromInvitations(invitation)
		user.save()
	}

	void acceptInvitation(Invitation invitation){
		def user = invitation.invitee
		def team = invitation.team
		user.team = team
		user.save()
	}

	void addInvitation(Invitation invitation){
		def user = invitation.invitee
		user.addToInvitations(invitation)
		user.save()
	}

	void removeTeam(User user){
		if (user != null){
			user.team = null
			user.save()
		}
	}
	
	void addToTrips(Trip trip, User user){
		user.addToTrips(trip)
		user.save()
	}

	User get(Integer id){
		User.get(id)
	}

	List<User> getAll(){
		User.getAll()
	}
}
