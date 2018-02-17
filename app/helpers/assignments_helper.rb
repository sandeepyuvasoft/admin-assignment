module AssignmentsHelper
	def assignment_users(assignment)
		assignment.users.map{|u| u if u.type == 'Student'}
	end
end
