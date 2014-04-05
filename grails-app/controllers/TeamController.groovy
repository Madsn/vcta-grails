import org.apache.shiro.SecurityUtils

class TeamController {

	def create(){
		render(view: 'create')
	}

	def save() {
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())
		println params
		def teamName = params.name

		def team = new Team(name: teamName, leader: currentUser)
		// For debugging
		def user2 = User.get(1)
		user2.team = team
		user2.save()
		team.addToMembers(user2)
		// -----

		currentUser.team = team
		currentUser.save()
		team.addToMembers(currentUser)
		team.save()
		redirect (controller:'dashboard')
	}

	def delete() {
		def team = Team.get(Integer.parseInt(params.id))
		if(team != null){
			for (u in team.members){
				u.team = null
				u.save()
			}
			team.delete()
		}
		redirect (controller:'dashboard')
	}

	def removefromteam() {
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())

		def userToRemove = User.get(Integer.parseInt(params.userid))
		def team = Team.get(Integer.parseInt(params.teamid))
		if (currentUser != team.leader){
			redirect (controller:'dashboard', params: ['error': 'Only the leader can remove team members'])
		}else if (currentUser == userToRemove){
			redirect(controller:'dashboard', params: ['error': 'You can\'t remove the leader from the group, appoint a new leader first'])
		} else {

			userToRemove.team = null
			team.removeFromMembers(userToRemove)
			userToRemove.save()
			team.save()
			redirect (controller:'dashboard')
		}
	}
}
