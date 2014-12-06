module UsersHelper

	def getGroups(did)
		groups = []
	    user = User.find(did)
	    memberships = user.memberships

	    memberships.each { |m|
	    	groups.push(m.group_name)
	    }

	    return groups
	end
end
