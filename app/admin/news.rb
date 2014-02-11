ActiveAdmin.register News do

  menu :parent => "Editing", :priority => 2

  scope :published
  scope :draft

  index do
    column :title
    column :author
    column :published
    column :created_at
    column :updated_at

    default_actions

  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :author
      f.input :published
      f.input :created_at
    end
    f.inputs "SEO" do
      f.input :description, :as => :string
      f.input :keywords
    end
    f.buttons
  end

  filter :title
  filter :author
  filter :published
  filter :created_at
  filter :updated_at
  filter :description
  filter :keywords

end
