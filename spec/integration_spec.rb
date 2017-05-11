require "capybara/rspec"
require "spec_helper"
require "./app"
require "pry"

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
    fill_in("begin_date",:with => "03/02/2017")
    fill_in("end_date",:with => "03/04/2018")
    click_button("Add project")
    expect(page).to have_content("humana")
  end
end
