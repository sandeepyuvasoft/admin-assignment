class AssignmentsController < ApplicationController
	def index
		@assignments = current_user.assignments
	end

	def user_status
		@assignment = Assignment.find(params[:a_id])
		@assigned_user = AssignedUser.where(user_id: params[:u_id] , assignment_id: params[:a_id]).first
	end
end
