import Util

class TeamController {

	def create(){
		render(view: 'create')
	}

	def save() {
		def currentUser = Util.getCurrentUser()
		println params
		def teamName = params.name

		def team = new Team(name: teamName, leader: currentUser)
		// For debugging
		def user2 = User.get(1)
		user2.team = team
		user2.save()
		team.addToUsers(user2)
		// -----

		currentUser.team = team
		currentUser.save()
		team.addToUsers(currentUser)
		team.save()
		redirect (controller:'dashboard')
	}

	def delete() {
		def currentUser = Util.getCurrentUser()
		def team = Team.get(Integer.parseInt(params.id))
		if(team != null && currentUser == team.leader){
			for (u in team.users){
				u.team = null
				u.save()
			}
			team.delete()
		}
		redirect (controller:'dashboard')
	}

	def removefromteam() {
		def currentUser = Util.getCurrentUser()

		def userToRemove = User.get(Integer.parseInt(params.userid))
		def team = Team.get(Integer.parseInt(params.teamid))
		if (userToRemove == team.leader){
			redirect (controller:'dashboard', params: ['error': 'You can\'t remove the leader from the group, appoint a new leader first'])
		} else if (currentUser != userToRemove && currentUser != team.leader){
			redirect(controller:'dashboard', params: ['error': 'Only the leader can remove team members'])
		} else {

			userToRemove.team = null
			team.removeFromUsers(userToRemove)
			userToRemove.save()
			team.save()
			redirect (controller:'dashboard')
		}
	}

	def transferleadership() {
		def currentUser = Util.getCurrentUser()

		def newLeader = User.get(Integer.parseInt(params.userid))
		def team = Team.get(Integer.parseInt(params.teamid))
		if (currentUser != team.leader){
			redirect (controller:'dashboard', params: ['error': 'Only the leader can transfer leadership'])
		}else {
			team.leader = newLeader
			team.save()
			redirect (controller:'dashboard')
		}
	}
}
