ActiveAdmin.register Batch do
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
	permit_params :course_id,:name,:academic_year,:start_date,:end_date
	form do |f|
    f.inputs do
    	if (params[:action] == "edit")
    		f.input :course_id, :input_html => { :value => batch.course.course_name ,:readonly=>true}, :as => :string
    	else
    		f.input :course_id, :label => 'Course', :as => :select, :collection => Course.all.map{|u| ["#{u.course_name}", u.id]}, :include_blank => false
    	end
      f.input :name
      f.input :academic_year
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end
end
