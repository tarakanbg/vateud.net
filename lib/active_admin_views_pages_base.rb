class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document
 
  private
 
  def build_footer
    div :id => "footer" do
      para "Copyright &copy; #{Date.today.year.to_s} #{link_to('vateud.net', 'http://vateud.net')}".html_safe
    end
  end
 
end