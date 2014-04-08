import org.springframework.transaction.annotation.Transactional

@Transactional
class InvitationService {

	def teamService
	def userService

	void acceptInvitation(Invitation invitation){
		teamService.acceptInvitation(invitation)
		userService.acceptInvitation(invitation)
		
		invitation.delete()
	}

	void createInvitation(Invitation invitation){
		invitation.validate()

		invitation.save()
		userService.addInvitation(invitation)
		teamService.addInvitation(invitation)
	}

	void dismissInvitation(Invitation invitation){
		userService.removeFromInvitations(invitation)
		teamService.removeFromPendingInvitations(invitation)
		invitation.delete()
	}
	
	void deleteAllInvitationsFromTeam(Team team){
		def invitations = Invitation.findWhere(team: team)
		for (i in invitations){
			userService.removeFromInvitations(i)
			i.delete()
		}
	}

	Invitation get(Integer id){
		Invitation.get(id)
	}
}
