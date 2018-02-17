ActiveAdmin.register User do
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

  permit_params :email,:password,:password_confirmation,:type,:course_id,:batch_id

	form do |f|
    f.inputs do
      f.input :course_id, :label => 'Course', :as => :select, :collection => Course.all.map{|u| ["#{u.course_name}", u.id]}, :include_blank => false
      f.input :batch_id, :label => 'Batch', :as => :select, :collection => Batch.all.map{|u| ["#{u.name}", u.id]}, :include_blank => false
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :type, :as => :select, :collection => ['Teacher', 'Student'], :include_blank => false
    end
    f.actions
  end
end
