import Team
import User

class ScoreboardController {
	
	def index(){
		def teams = Team.getAll()
		def users = User.getAll()
		println users
		println teams
		render(view:'scoreboard', model: [teams: teams, users: users])
	}

}
