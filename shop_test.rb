require 'test/unit'
require './user'
require './project'

include Shop
class ShopTest  < Test::Unit::TestCase

  def test_initial_projects_count
    githubber  = User.new("githubber@github.com","githubber")
    assert_equal 0, githubber.projects.length
  end

  def test_adding_new_project
  	githubber  = User.new("githubber@github.com","githubber")
  	
  end
end
