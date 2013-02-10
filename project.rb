module Shop
  class Project
    attr_reader :icon, :screenshot
    attr_accessor :name, :link, :short_about, :about, :update_icon, :update_screenshot 
    def initialize(user,name,link,icon,screenshot,short_about,about)
      @user         = user
      @name         = name
      @link         = link
      @screenshot   = store_screenshot(name,screenshot)
      @icon         = store_icon(name,icon)
      @short_about  = short_about
      @about        = about
      user.add_project(self)
    end

    def store_icon(project_name,image)
      #push image to server and rename to project_name
      return "http://icon_hosting/images/#{project_name}/icon.png"
    end

    def store_screenshot(project_name,screenshot)
      #push image to server 
      return "http://screenshot_hosting/images/#{project_name}/#{screenshot}"
    end
    def author
      return @user.login
    end
    def update_icon(icon)
      @icon = store_icon(@name,icon)
    end
    def update_screenshot(screenshot)
      @screenshot = store_screenshot(@name,screenshot)
    end

  end
end