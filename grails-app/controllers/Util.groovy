import org.apache.shiro.SecurityUtils

class Util {

	public static User getCurrentUser(){
		def subject = SecurityUtils.getSubject()
		def currentUser = User.get(subject.getPrincipal())
		return currentUser
	}
}
