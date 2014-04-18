
import User
import Util

class DashboardController {

	def index() {
		def currentUser = Util.getCurrentUser()
		if (currentUser == null){
			redirect uri: '/login'
		} else {
			def map = [user: currentUser, error: params.error, msg: params.msg]
			render(view: 'dash', model: map)
		}
	}
	
	User getCurrentUser(){
		return Util.getCurrentUser();
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
