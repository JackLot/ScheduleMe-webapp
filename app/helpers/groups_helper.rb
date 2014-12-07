module GroupsHelper
	
	def getUsers(group_name)
		users = []
	    group = Group.find(group_name)
	    memberships = group.memberships

	    memberships.each { |m|
	    	users.push(m.did)
	    }

	    return users
	end
end
