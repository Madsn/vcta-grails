import Util

class MemberController {
	
	def userService
	
	def show() {
		def user = userService.get(Integer.parseInt(params.id))
		render (view:'userinfo', model: [user: user])
	}

}
