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
		if (invitation.team.pendingInvitations.any {it.invitee = invitation.invitee}){
			return
		}
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
		invitations.each {
			userService.removeFromInvitations(it)
			it.delete()
		}
	}

	Invitation get(Integer id){
		Invitation.get(id)
	}
}
