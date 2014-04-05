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
		team.addToMembers(currentUser)
		team.save()
		currentUser.team = team
		currentUser.save()
		redirect (controller:'dashboard')
	}
	
	def delete() {
		def team = Team.get(Integer.parseInt(params.id))
		team.delete()
		redirect (controller:'dashboard')
	}
}
