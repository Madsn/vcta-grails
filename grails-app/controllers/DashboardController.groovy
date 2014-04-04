
import User
import Team

class DashboardController {
	
    def index() { 
		render(view: 'dash')
	}
	
	def list() {
		def userList = User.list()
		def newTeam = new Team(name: "blap", leader: userList.get(0))
		newTeam.addMember(userList.get(0))
		newTeam.save()
		def map = [users: userList, teams: Team.list()]
		println User.list()
		render(view: 'dash', model: map)
	}
}
