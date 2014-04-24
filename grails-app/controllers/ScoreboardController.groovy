import Team
import User

class ScoreboardController {

	def teamService
	def userService

	def index(){
		def teams = teamService.getAll()
		def users = userService.getAll()
		render(view:'scoreboard', model: [teams: teams, users: users, page: 'teams'])
	}

	def users(){
		def teams = teamService.getAll()
		def users = userService.getAll()
		def sortOrder = params.order
		def sortField = params.sort
		def page = params.page
		if (sortOrder != null && sortField != null){
			if (sortField == "team"){
				users.sort{ a, b ->
					if (sortOrder == 'desc') {
						b."${sortField}"?.name <=> a."${sortField}"?.name
					} else {
						a."${sortField}"?.name <=> b."${sortField}"?.name
					}
				}
			} else {
				users.sort{ a, b ->
					if (sortOrder == 'desc') {
						b."${sortField}" <=> a."${sortField}"
					} else {
						a."${sortField}" <=> b."${sortField}"
					}
				}
			}
		}
		render(view:'scoreboard', model: [teams: teams, users: users, page: 'users'])
	}

	def teams(){
		def teams = teamService.getAll()
		def users = userService.getAll()
		def sortOrder = params.order
		def sortField = params.sort
		def page = params.page
		if (sortOrder != null && sortField != null){
			if (sortField == "leader"){
				teams.sort{ a, b ->
					if (sortOrder == 'desc') {
						b."${sortField}".username <=> a."${sortField}".username
					} else {
						a."${sortField}".username <=> b."${sortField}".username
					}
				}
			}else{
				teams.sort{ a, b ->
					if (sortOrder == 'desc') {
						b."${sortField}" <=> a."${sortField}"
					} else {
						a."${sortField}" <=> b."${sortField}"
					}
				}
			}
		}
		render(view:'scoreboard', model: [teams: teams, users: users, page: 'teams'])
	}
}
