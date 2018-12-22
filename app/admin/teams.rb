ActiveAdmin.register Team do
  permit_params :name, :photo

  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column 'photo' do |team|
      image_url = team.photo.url
      image_tag image_url, size: '50x50' if image_url.present?
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end