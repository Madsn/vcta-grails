import org.springframework.transaction.annotation.Transactional

@Transactional
class UserService extends grails.plugin.nimble.core.UserService {
	
	private int adminIndex = -1
	
	User getAdmin() {
		if(this.adminIndex < 0){
			this.adminIndex = User.findByUsername('admin').id
			log.info 'UserService.getAdmin() - Refreshing admin index'
		} else {
			log.info 'UserService.getAdmin() - Using existing admin index'
		}
		return User.get(this.adminIndex)
	}

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
		def users = User.getAll()
		users.remove(this.getAdmin())
		return users
	}
}
