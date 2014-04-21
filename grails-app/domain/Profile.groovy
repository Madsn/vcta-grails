


class Profile extends grails.plugin.nimble.core.ProfileBase {

	// Extend ProfileBase with your custom values here
	static constraints = {
		fullName(nullable: true, blank: false)
		nickName(nullable: true, blank: false)
		email(nullable:false, blank:false, email: true, unique: true, validator: { val -> val.toLowerCase().endsWith('systematic.com')})
		nonVerifiedEmail(nullable:true, blank:false, email: true)
		emailHash(nullable: true, blank:true)
		dateCreated(nullable: true) // must be true to enable grails
		lastUpdated(nullable: true) // auto-inject to be useful which occurs post validation
	}
}
