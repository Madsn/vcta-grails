import Util

class TeamController {
	
	def teamService
	def userService
	def invitationService

	def create(){
		render(view: 'create')
	}

	def save() {
		def currentUser = Util.getCurrentUser()
		def teamName = params.name
		if (teamName.size() < 4){
			render(view: 'create', model: ['error': 'Name must be at least 4 characters'])
		} else if (teamService.findByName(teamName) != null) {
			render(view: 'create', model: ['error': 'Team with that name already exists'])
		} else {
			teamService.create(teamName, currentUser)
			redirect (controller:'dashboard')
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
			redirect (controller:'dashboard', params: ['error': 'You can\'t remove the leader from the group, appoint a new leader first'])
		} else if (currentUser != userToRemove && currentUser != team.leader){
			redirect(controller:'dashboard', params: ['error': 'Only the leader can remove team members'])
		} else {
			teamService.removeFromUsers(userToRemove, team)
			redirect (controller:'dashboard')
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
