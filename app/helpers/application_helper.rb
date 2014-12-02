module ApplicationHelper

	# Given a DID return the id of the user in the DB
	def getUserId(did)
		return User.where(did: params[:did])[:id]
	end

end
