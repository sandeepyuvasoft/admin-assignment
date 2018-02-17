ActiveAdmin.register Course do
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
  permit_params :course_name,:code,:duration,batches_attributes: [:id,:name,:academic_year,:start_date,:end_date,:_destroy]

	form do |f|
    f.inputs do
      f.input :course_name
      f.input :code
      f.input :duration
    end
    f.inputs do
      f.has_many :batches, heading: false, allow_destroy: true,new_record: true do |a|
        a.input :name
        a.input :academic_year
        a.input :start_date
        a.input :end_date
  	  end
    end
    f.actions
  end

  controller do
    def new
      @course = Course.new
      1.times {@course.batches.new}
    end
  end
end
