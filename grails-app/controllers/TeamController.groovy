import Util

class TeamController {

	def teamService
	def userService
	def invitationService

	def beforeInterceptor = [action: this.&manageDisabledIntercept, except: 'show']
	
	private manageDisabledIntercept(){
		if (!SettingsController.manageAllowed()){
			redirect(controller:'dashboard', params: ['error': 'Team management has been disabled by the admin.'])
			return
		}
	}
	
	def create(){
		render(view: 'create')
	}

	def show(){
		def team = teamService.get(Integer.parseInt(params.id))
		render(view: 'teaminfo', model: [team: team])
	}

	def manage(){
		def currentUser = Util.getCurrentUser()
		if (currentUser.team?.leader == currentUser){
			def users = userService.getAll()
			currentUser.team?.users.each { users.remove(it) }
			render(view: 'manage', model: [user: currentUser, users: users, error: params.error, msg: params.msg])
		} else {
			redirect(controller:'dashboard', params: ['error': 'Only the team captain can manage a team'])
		}
	}

	def save() {
		def currentUser = Util.getCurrentUser()
		def teamName = params.name
		if (teamName.size() < 4){
			redirect(controller: 'dashboard', params: ['error': 'Team name must be at least 4 characters'])
		} else if (teamService.findByName(teamName) != null) {
			redirect(controller: 'dashboard', params: ['error': 'Team with that name already exists'])
		} else {
			teamService.create(teamName, currentUser)
			redirect (controller:'dashboard', params: ['msg': 'Team created'])
		}
	}

	def delete() {
		def currentUser = Util.getCurrentUser()
		def team = teamService.get(Integer.parseInt(params.id))
		if(team != null && currentUser == team.leader){
			teamService.disbandTeam(team)
			invitationService.deleteAllInvitationsFromTeam(team)
		}
		redirect (controller:'dashboard')
	}

	def removefromteam() {
		def currentUser = Util.getCurrentUser()

		def userToRemove = userService.get(Integer.parseInt(params.userid))
		def team = teamService.get(Integer.parseInt(params.teamid))
		if (userToRemove == team.leader){
			redirect (controller:'team', action:'manage', params: ['error': 'You can\'t remove the leader from the group, appoint a new leader first'])
		} else if (currentUser == userToRemove){
			teamService.removeFromUsers(userToRemove, team)
			redirect (controller:'dashboard')
		} else if (currentUser == team.leader){
			redirect (controller:'team', action:'manage', params: [msg: 'User removed from team'])
		} else {
			redirect(controller:'dashboard', params: ['error': 'Only the leader can remove team members'])
		}
	}

	def transferleadership() {
		def currentUser = Util.getCurrentUser()

		def newLeader = userService.get(Integer.parseInt(params.userid))
		def team = teamService.get(Integer.parseInt(params.teamid))
		if (currentUser != team.leader){
			redirect (controller:'dashboard', params: ['error': 'Only the leader can transfer leadership'])
		}else {
			teamService.setLeader(newLeader, team)
			redirect (controller:'dashboard')
		}
	}
}
