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
		user.team = invitation.team
		user.removeFromInvitations(invitation)
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

	User get(Integer id){
		User.get(id)
	}

	List<User> getAll(){
		User.getAll()
	}
}
