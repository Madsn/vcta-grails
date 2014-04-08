import org.springframework.transaction.annotation.Transactional

@Transactional
class TeamService extends grails.plugin.nimble.core.GroupService {

	def userService

	void addToUsers(User invitee, Team team){
		team.addToUsers(invitee)
		team.save()
	}

	void create(Team team){
		team.addToUsers(team.leader)
		team.save()
		userService.setTeam(team, team.leader)
	}

	void removeFromPendingInvitations(Invitation invitation){
		def team = invitation.team
		team.removeFromPendingInvitations(invitation)
		team.save()
	}

	void acceptInvitation(Invitation invitation){
		def team = invitation.team
		def invitee = invitation.invitee
		team.addToUsers(invitee)
		team.save()
	}

	void addInvitation(Invitation invitation){
		def team = invitation.team
		team.addToPendingInvitations(invitation)
		team.save()
	}

	void disbandTeam(Team team){
		if (team != null){
			for (u in team.users){
				userService.removeTeam(u)
			}
			team.delete()
		}
	}

	void removeFromUsers(User user, Team team){
		userService.removeTeam(user)
		team.removeFromUsers(user)
		team.save()
	}

	void setLeader(User user, Team team){
		team.leader = user
		team.save()
	}

	Team get(Integer id){
		Team.get(id)
	}

	List<Team> getAll(){
		Team.getAll()
	}
}
