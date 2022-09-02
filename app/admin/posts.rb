ActiveAdmin.register Post do

  actions :index, :show, :create, :edit, :update, :profile, :destroy

  permit_params :title, :description, :user_id

  index do
    selectable_column
    column :title
    column :description
    column :user
    column :created_at
    actions only: :profile do |resource|
      link_to "Author", admin_user_path(resource.user)
    end
  end

end
