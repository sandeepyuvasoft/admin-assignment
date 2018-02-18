class AssignmentsController < ApplicationController
	def index
		@assignments = current_user.assignments
	end

	def create
		assigned_user = AssignedUser.find_by(assignment_id: params[:assignment_id], user_id: current_user.id)
		if assigned_user.update(status: params[:status])
			redirect_to assignments_path
		end
	end

	def show
		@assignment = Assignment.find(params[:id])
		@assigned_user = AssignedUser.where(user_id: current_user.id , assignment_id: params[:id]).first
	end

	def user_status
		@assignment = Assignment.find(params[:a_id])
		@assigned_user = AssignedUser.where(user_id: params[:u_id] , assignment_id: params[:a_id]).first
	end

	def create_comment
		comment = Comment.create(comment: params[:data],user_id:params[:u_id],assignment_id: params[:a_id])
		if request.xhr?
      respond_to do |format|
        format.js
      end
    end
	end

end
