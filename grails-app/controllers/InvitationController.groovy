import Util

class InvitationController {
	
	def invitationService
	def userService
	def teamService

	def accept(){
		def currentUser = Util.getCurrentUser()

		def invitation = invitationService.get(Integer.parseInt(params.id))
		def invitee = invitation.invitee

		if (currentUser != invitee){
			redirect(controller:'dashboard', params:['error':'Only invitee can accept an invitation'])
		} else {
			invitationService.acceptInvitation(invitation)
			redirect(controller:'dashboard', params:['msg':'Team invitation was accepted'])
		}
	}

	def create(){
		def users = userService.getAll()
		render(view:'create', model: [users: users])
	}
	
	def save(){
		def currentUser = Util.getCurrentUser()
		def invitingTeam = currentUser.team
		def invitee = userService.get(Integer.parseInt(params.userid))

		if (currentUser != invitingTeam.leader){
			redirect(controller:'dashboard', params:['error':'Only leader can invite members to join a team'])
		} else if (invitingTeam.users.contains(invitee)){
			redirect(controller:'dashboard', params:['error':'User already a member of that team'])
		} else {
			def invitation = new Invitation(team: invitingTeam, invitee: invitee)
			invitationService.createInvitation(invitation)
			redirect(controller:'dashboard', params:['msg':'Invitation successfully sent'])
		}
	}

	def dismiss(){
		def currentUser = Util.getCurrentUser()
		def invitation = invitationService.get(Integer.parseInt(params.id))

		if (currentUser == invitation.invitee || currentUser == invitation.team.leader){
			invitationService.dismissInvitation(invitation)
			redirect(controller:'dashboard', params:['msg':'Invitation dismissed'])
		} else {
			redirect(controller:'dashboard', params:['error':'Only leader or invitee can dismiss invitations'])
		}
	}
}
