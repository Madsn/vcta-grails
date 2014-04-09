import org.springframework.transaction.annotation.Transactional

@Transactional
class TeamService extends grails.plugin.nimble.core.GroupService {

	void addToUsers(User invitee, Team team){
		team.addToUsers(invitee)
		team.save()
	}

	void create(String name, User leader){
		def team = new Team(name: name, leader: leader)
		team.addToUsers(team.leader)
		team.save()
		leader.team = team
		leader.save()
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
				u.team = null
				u.save()
			}
			team.delete()
		}
	}

	void removeFromUsers(User user, Team team){
		user.team = null
		user.save()
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
