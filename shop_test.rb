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
  	assert_equal 0, githubber.projects.length
  	name = "CoffeApp"
  	link = "http://github.com/githubber/coffee_project"
  	icon = "icon.png"
  	screenshot = "screenshot.png"
  	short_about = "This is sample coffee application"
  	about = "" #to fill later
  	coffee_project = Project.new(githubber,name,link,icon,screenshot,short_about,about)
  	assert_equal 1, githubber.projects.length
  	assert_match name, coffee_project.name
  	assert_match link, coffee_project.link
  	assert_match short_about, coffee_project.short_about
  	assert_match about, coffee_project.about
  	assert_match githubber.login, coffee_project.author

  end
  def test_storing_icon
  	githubber  = User.new("githubber@github.com","githubber")
  	name = "CoffeApp"
  	link = "http://github.com/githubber/coffee_project"
  	icon = "icon.png"
  	screenshot = "screenshot.png"
  	short_about = "This is sample coffee application"
  	about = "" #to fill later
  	coffee_project = Project.new(githubber,name,link,icon,screenshot,short_about,about)
  	assert_match "http://icon_hosting/images/#{name}/icon.png", coffee_project.icon
  end

  def test_storing_screenshot
  	githubber  = User.new("githubber@github.com","githubber")
  	name = "CoffeApp"
  	link = "http://github.com/githubber/coffee_project"
  	icon = "icon.png"
  	screenshot = "screenshot.png"
  	short_about = "This is sample coffee application"
  	about = "" #to fill later
  	coffee_project = Project.new(githubber,name,link,icon,screenshot,short_about,about)
  	assert_match "http://screenshot_hosting/images/#{name}/#{screenshot}", coffee_project.screenshot
  end
  def test_update_screenshot
  	githubber  = User.new("githubber@github.com","githubber")
  	name = "CoffeApp"
  	link = "http://github.com/githubber/coffee_project"
  	icon = "icon.png"
  	screenshot = "screenshot.png"
  	short_about = "This is sample coffee application"
  	about = "" #to fill later
  	coffee_project = Project.new(githubber,name,link,icon,screenshot,short_about,about)
  	
  	new_screenshot = 'screeeeeeen.png'
  	coffee_project.update_screenshot(new_screenshot)
  	assert_match "http://screenshot_hosting/images/#{name}/#{new_screenshot}", coffee_project.screenshot
  end

  def test_param_change
  	githubber  = User.new("githubber@github.com","githubber")
  	name = "CoffeApp"
  	link = "http://github.com/githubber/coffee_project"
  	icon = "icon.png"
  	screenshot = "screenshot.png"
  	short_about = "This is sample coffee application"
  	about = "old_about" #to fill later
  	coffee_project = Project.new(githubber,name,link,icon,screenshot,short_about,about)
  	coffee_project.about =  "new_about"
  	assert_match githubber.projects[0].about, coffee_project.about

  	coffee_project.link =  "http://github.com/githubber/coffee_project2"
  	coffee_project.short_about = "new short"

  	assert_equal githubber.projects[0], coffee_project
  	# ^ http://cdn.memegenerator.net/instances/400x/34647287.jpg ruby
  end
end
