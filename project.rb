module Shop
  class Project
    attr_reader :user, :link, :icon, :short_about, :about, :screenshot
    def initialize(user,link,icon,screenshot,short_about,about)
      @user =user
      @link = link
      @screenshot = screenshot
      @icon = icon
      @short_about ='short_about'
      @about = about
    end


  end
end