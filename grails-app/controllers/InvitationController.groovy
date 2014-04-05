import org.apache.shiro.SecurityUtils

class InvitationController {

	def accept(){
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())

		def invitation = Invitation.get(Integer.parseInt(params.id))
		def team = invitation.team
		def invitee = invitation.invitee
		if (currentUser != invitee){
			redirect(controller:'dashboard', params:['error':'Only invitee can accept an invitation'])
		} else {
			team.addToMembers(invitation.invitee)
			team.removeFromPendingInvitations(invitation)
			team.save()
			invitee.team = invitation.team
			invitee.save()
			invitation.delete()
			redirect(controller: 'dashboard', params:['msg':'Team invitation was accepted'])
		}
	}

	def create(){
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())
		def invitingTeam = Team.get(Integer.parseInt(params.teamid))
		def invitee = User.get(Integer.parseInt(params.userid))
		if (currentUser != invitingTeam.leader){
			redirect(controller:'dashboard', params:['error':'Only leader can invite members to join a team'])
		} else if (invitingTeam.users.contains(invitee)){
			redirect(controller:'dashboard', params:['error':'User already a member of that team'])
		} else {
			def invitation = new Invitation(team: invitingTeam, invitee: invitee)
			invitation.save()
			invitee.addToInvitations(invitation)
			invitee.save()
			invitingTeam.addToPendingInvitations(invitation)
			invitingTeam.save()
			redirect(controller:'dashboard', params:['msg':'Invitation successfully sent'])
		}
	}

	def dismiss(){
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())
		def invitation = Invitation.get(Integer.parseInt(params.id))
		if (currentUser == invitation.invitee || currentUser == invitation.team.leader){
			def user = invitation.invitee
			user.removeFromInvitations(invitation)
			user.save()
			def team = invitation.team
			team.removeFromPendingInvitations(invitation)
			team.save()
			invitation.delete()
			redirect(controller:'dashboard', params:['msg':'Invitation dismissed'])
		} else {
			redirect(controller:'dashboard', params:['error':'Only leader or invitee can dismiss invitations'])
		}
	}
}
