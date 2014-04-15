import Team
import User

class ScoreboardController {
	
	def teamService
	def userService
	
	def index(){
		def teams = teamService.getAll()
		def users = userService.getAll()
		render(view:'scoreboard', model: [teams: teams, users: users])
	}

}
