ActiveAdmin.register Layout do

  menu :parent => "Administration", :priority => 2

  filter :name
  filter :priority

  index do    
    column :name
    column :priority    
        
    default_actions        
  end
  
end
