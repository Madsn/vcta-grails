
import User

class DashboardController {
	
    def index() { 
		render(view: 'dash')
	}
	
	def list() {
		def map = [users: User.list()]
		render(view: 'dash', model: map)
	}
}
