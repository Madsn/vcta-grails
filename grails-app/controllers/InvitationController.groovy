
import Util

class InvitationController {

	def grailsApplication
	def invitationService
	def userService
	def teamService
	
	def beforeInterceptor = [action: this.&manageDisabledIntercept]
	
	private manageDisabledIntercept(){
		if (!SettingsController.manageAllowed()){
			redirect(controller:'dashboard', params: ['error': 'Team management has been disabled by the admin.'])
			return false
		}
	}
	
	def accept(){
		def currentUser = Util.getCurrentUser()

		def invitation = invitationService.get(Integer.parseInt(params.id))
		def invitee = invitation.invitee

		if (currentUser != invitee){
			redirect(controller:'dashboard', params:['error':'Only invitee can accept an invitation'])
		} else if (currentUser.team?.leader == currentUser){
			redirect(controller:'dashboard', params:['error':'You must disband your own team or transfer leadership before joining another team'])
		} else {
			invitationService.acceptInvitation(invitation)
			redirect(controller:'dashboard', params:['msg':'Team invitation was accepted'])
		}
	}

	def create(){
		def currentUser = Util.getCurrentUser()
		def users = userService.getAll()
		currentUser.team?.users.each {
			users.remove(it)
		}
		def team = teamService.get(Integer.parseInt(params.teamid))
		render(view:'create', model: [users: users, team: team])
	}
	
	def save(){
		def currentUser = Util.getCurrentUser()
		def invitingTeam = currentUser.team
		if (params.userid == null){
			redirect(controller:'team', action:'manage', params:['error':'Invalid user'])
			return
		}
		def invitee = userService.get(Integer.parseInt(params.userid))

		if (currentUser != invitingTeam.leader){
			redirect(controller:'team', action:'manage', params:['error':'Only leader can invite members to join a team'])
		} else if (invitingTeam.users.contains(invitee)){
			redirect(controller:'team', action:'manage', params:['error':'User already a member of that team'])
		} else {
			def invitation = new Invitation(team: invitingTeam, invitee: invitee)
			invitationService.createInvitation(invitation)
			def messageConf = grailsApplication.config.nimble.messaging
			if(messageConf.enabled) {
				sendMail {
					to invitee.getProfile().email
					from messageConf.mail.from
					subject messageConf.invitation.subject
					html g.render(template: "/templates/nimble/mail/invitation_email", model: [invitation: invitation]).toString()
				}
			}
			redirect(controller:'team', action:'manage', params:['msg':'Invitation successfully sent'])
		}
	}

	def dismiss(){
		def currentUser = Util.getCurrentUser()
		def invitation = invitationService.get(Integer.parseInt(params.id))
		if (invitation == null){
			redirect(controller:'dashboard', params:['error':'That invitation no longer exists'])
			return
		}

		if (currentUser == invitation.invitee || currentUser == invitation.team.leader){
			if (currentUser == invitation.team.leader){
				redirect(controller:'team', action:'manage', params:['msg':'Invitation dismissed'])
			} else {
				redirect(controller:'dashboard', params:['msg':'Invitation dismissed'])
			}
			invitationService.dismissInvitation(invitation)
		} else {
			redirect(controller:'dashboard', params:['error':'Only leader or invitee can dismiss invitations'])
		}
	}
}
