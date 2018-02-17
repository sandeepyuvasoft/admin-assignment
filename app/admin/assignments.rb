ActiveAdmin.register Assignment do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name,:subject_id,:start_time,:end_time,:assigned_users

	form do |f|
    f.inputs do
    	f.input :name
      f.input :subject_id, :label => 'Subject', :as => :select, :collection => Subject.all.map{|u| ["#{u.name}", u.id]}, :include_blank => false
      f.input :start_time
      f.input :end_time
      f.input :assigned_users, :label => 'Student', :as => :select, :collection => Student.all.map{|u| ["#{u.email}", u.id]}, :include_blank => false
      f.input :assigned_users, :label => 'Teacher', :as => :select, :collection => Teacher.all.map{|u| ["#{u.email}", u.id]}, :include_blank => false
    end
    f.actions
  end

  controller do
    def create
    	super
    	user_ids = params[:assignment][:assigned_user_ids].reject(&:empty?)
    	if user_ids.present?
    		user_ids.each do |user|
    			user = User.find(user)
    			@assignment.assigned_users.create(user_id: user.id)
    		end
    	end
    end
    def update
     	super
    	user_ids = params[:assignment][:assigned_user_ids].reject(&:empty?)    	
    	if user_ids.present?
    		user_ids.each do |user|
    			AssignedUser.find_or_create_by(user_id: user.id, assignment_id: @assignment.id)
    		end
    	end
    end
  end

end