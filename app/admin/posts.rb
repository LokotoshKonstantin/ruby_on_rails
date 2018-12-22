ActiveAdmin.register Post do
  permit_params :title, :text, :admin_user_id

  filter :title
  after_build do |x|
    x.admin_user = current_admin_user
  end

  index do
    selectable_column
    id_column
    column :title
    column :author do |p|
      p.admin_user.email
    end
    column :created_at
    actions
  end
end