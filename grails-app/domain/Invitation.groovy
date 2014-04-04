

class Invitation {

	static belongsTo = [team: Team, invitee: User]
	static constraints = {
		invitee(nullable:true, blank:true)
	}
}
