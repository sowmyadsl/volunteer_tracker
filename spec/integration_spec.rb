require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("the volunteer tracker path", {:type => :feature}) do
  it("returns a table of projects added on the first page") do
    visit("/")
    expect(page).to have_content("Welcome to the Volunteer Tracker There are no projects added yet! View All Projects View All Volunteers")
  end

  it("adds a project to database") do
    visit("/projects")
    fill_in("proj_name",:with => "humana")
    fill_in("begin_date",:with => "17/03/02")
    fill_in("end_date",:with => "18/03/04")
    click_button("")
    expect(page).to have_content("humana 17/03/02 18/03/04")
  end
end
