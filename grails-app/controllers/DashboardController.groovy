
import User
import Team
import Trip
import Profile
import org.apache.shiro.SecurityUtils

class DashboardController {

	def index() {
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())
		println currentUser
		if (currentUser == null){
			redirect uri: '/login'
		} else {
			

//					def newTeam = new Team(name: "blap", leader: currentUser)
//					newTeam.addToMembers(currentUser)
//					newTeam.save(flush: true)
//			
//					currentUser.team = newTeam
//					currentUser.save(flush: true)

			//		def user = new User()
			//		user.username = "user3"
			//		user.pass = 'useR123!'
			//		user.passConfirm = 'useR123!'
			//		user.enabled = true
			//
			//		def userProfile = new Profile()
			//		userProfile.fullName = "Test User"
			//		userProfile.owner = user
			//		user.profile = userProfile
			//
			//		log.info("Creating default user account with username:user")
			//		user.team = newTeam
			//
			//		def savedUser = userService.createUser(user)
			//		if (savedUser.hasErrors()) {
			//			savedUser.errors.each { log.error(it) }
			//			throw new RuntimeException("Error creating example user")
			//		}
			//
			//		newTeam.addMember(user)
			//		newTeam.save()

//			def newTrip = new Trip(startTime: new Date(), owner: currentUser)
//			newTrip.setOwner(currentUser)
//			newTrip.setDistanceKm(15.5)
//			newTrip.save()

			//
			//		def team = currentUser.team
			//		def tripList = Trip.findAllWhere(owner: currentUser)

			def map = [user: currentUser]
			render(view: 'dash', model: map)
		}
	}
}
