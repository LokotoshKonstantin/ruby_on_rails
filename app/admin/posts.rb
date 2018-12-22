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

  # show do
  #   attributes_table do
  #     row :title
  #     row :created_at
  #   end
  # end
  #
  # form do |f|
  #   f.inputs do
  #     f.input :title
  #     f.input :text, as: :froala_editor
  #   end
  #   f.actions
  # end

end