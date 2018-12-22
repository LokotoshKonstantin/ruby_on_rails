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

  show do
    attributes_table do
      row :name
      row :photo do |t|
        image_url = team.photo.url
        image_tag image_url, size: '50x50' if image_url.present?
      end
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      if f.object.photo.url.present?
        f.input :photo, :as => :file, :hint => image_tag(f.object.photo.url, class: 'image-preview')
      else
        f.input :photo, :as => :file
      end
    end
    f.actions
  end
end