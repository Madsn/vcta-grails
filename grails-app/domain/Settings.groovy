
class Settings {
	
	boolean manageAllowed
	String dashboardmsg // static on dashboard
	String flashmsg // flash after login
	String welcometext // login page
	boolean frozen // read-only access for users
	
	static constraints = {
		manageAllowed(nullable:false, default:true)
		dashboardmsg(nullable:true)
		flashmsg(nullable:true)
		welcometext(nullable:true)
		frozen(nullable:false, default:false)
	}

}
