
class InvitationController {

	def accept(){
		def invitation = Invitation.get(Integer.parseInt(params.id))
		invitation.team.addToMembers(invitation.invitee)
		invitation.save()
		invitation.invitee.team = invitation.team
		invitation.invitee.save()
		redirect(controller: 'dashboard')
	}
}
