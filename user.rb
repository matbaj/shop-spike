module Shop
  class User
    attr_reader :email, :login, :projects
    def initialize(email,login)
      @projects = []
      @email = email
      @login = login
    end

  end
end