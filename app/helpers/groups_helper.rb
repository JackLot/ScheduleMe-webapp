module GroupsHelper
	$defaultColors = ["#3a87ad","#F5A51B","#F51B1B","#B01BF5","#9E9E9E"]

	def getUsers(group_name)
		users = []
	    group = Group.find(group_name)
	    memberships = group.memberships

	    memberships.each { |m|
	    	users.push(m.did)
	    }

	    return users
	end

	def get_schedules(group_name)
		users = getUsers(group_name)

	end
end
