ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    #end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
       column do
         panel "Recent Page Updates" do
           ul do
             Page.order("updated_at DESC").limit(5).map do |post|
               li link_to(post.title, admin_page_path(post))
             end
           end
         end
       end

       column do
         panel "Recent News Updates" do
           ul do
             News.order("updated_at DESC").limit(5).map do |post|
               li link_to(post.title, admin_news_path(post)) + " by #{post.author.name}"
             end
           end
         end
       end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    end
  end # content
end
