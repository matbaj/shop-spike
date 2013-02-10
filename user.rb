module Shop
  class User
    attr_reader :login, :projects
    def initialize(email,login)
      @projects = [] #simulating relations
      @email = email
      @login = login
    end

    def add_project(project)
      @projects.push(project)
    end
  end
end