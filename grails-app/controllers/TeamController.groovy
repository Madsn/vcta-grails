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

		def team = new Team(name: teamName, leader: currentUser)
		team = teamService.create(team)

		userService.setTeam(team, currentUser)
		teamService.addToUsers(currentUser, team)
		redirect (controller:'dashboard')
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
			team.leader = newLeader
			team.save()
			redirect (controller:'dashboard')
		}
	}
}
