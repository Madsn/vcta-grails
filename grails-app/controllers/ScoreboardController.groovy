import Team
import User

class ScoreboardController {
	
	def teamService
	def userService
	
	def index(){
		def teams = teamService.getAll()
		def users = userService.getAll()
		println users
		println teams
		render(view:'scoreboard', model: [teams: teams, users: users])
	}

}
