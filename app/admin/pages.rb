ActiveAdmin.register Page do

  scope :main
  scope :visible
  scope :invisible

  index do    
    column :title
    column :description
    column :name
    column :visible    
    column :menu
    column :abstract   
    column :updated_at
    
    default_actions
        
  end

  form do |f|
    f.inputs "Details" do
      f.input :parent_id, :as => :select, :collection => Page.all, :include_blank => true, :label_method => :title
      f.input :title
      # f.input :post, :as => :hidden
      f.input :abstract
      f.input :visible      
      f.input :menu
      f.input :post
    end
    f.inputs "SEO" do
      f.input :name
      f.input :description, :as => :string
      f.input :keywords
    end
    f.buttons
  end

  show do    
    h3 page.title
    div do      
      all = resource.class.columns.collect{|column| column.name.to_sym }
      displayed = []
      desired = ["title", "description", "keywords", "name", "visible", "menu", "created_at", "updated_at"]
      for column in all
        displayed << column if desired.include?(column.to_s)        
      end      
      
      columns = displayed
      attributes_table *columns  
      div do
        render :partial => "tree", :locals => {:page => page }
      end
    end
    # div do
    #   render "picture" if religion.pictures.count > 0            
    # end  
  end  
  
end
