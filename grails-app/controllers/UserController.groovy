import Util

class UserController {
	
	def userService
	
	def show() {
		def user = userService.get(Integer.parseInt(params.id))
		render (view:'userinfo', model: [user: user])
	}

}
