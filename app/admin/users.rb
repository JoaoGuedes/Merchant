ActiveAdmin.register User do
  index do
    column :id
    column :name
    column :city
    column :about
    column :last_sign_in_at
    column :last_sign_in_ip
    default_actions
  end

end
