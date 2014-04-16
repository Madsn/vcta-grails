
import User
import Util
import Team
import Trip
import Profile

class DashboardController {

	def index() {
		def currentUser = Util.getCurrentUser()
		if (currentUser == null){
			redirect uri: '/login'
		} else {
			def errMsg = ""
			if (params.error != null){
				errMsg = params.error
			}
			def msg = ""
			if (params.msg != null){
				msg = params.msg
			}
			def map = [user: currentUser, error: errMsg, msg: msg]
			render(view: 'dash', model: map)
		}
	}
	
	int maxTripDay() {
		def today = new Date()
		if (today.month != 5){
			return 31
		} else {
			return today.date
		}
	}
}
