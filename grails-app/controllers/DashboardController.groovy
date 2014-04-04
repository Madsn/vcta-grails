
import User
import Team
import Trip
import org.apache.shiro.SecurityUtils

class DashboardController {

	def index() {
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())
		def userList = User.list()
		def newTeam = new Team(name: "blap", leader: currentUser)
		newTeam.addMember(currentUser)
		newTeam.save()
		
		def newTrip = new Trip(distanceKm: 15.5, startTime: new Date(), owner: currentUser)
		newTrip.save()
		
		def tripList = Trip.findAllWhere(owner: currentUser)
		def map = [users: userList, teams: Team.list(), trips: tripList]
		render(view: 'dash', model: map)
	}
}
