ActiveAdmin.register Patient1 do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :patientid, :name, :age, :sex, :email, :cause, :status, :doctor_id, :user_id, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:patientid, :name, :age, :sex, :email, :cause, :status, :doctor_id, :user_id, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
