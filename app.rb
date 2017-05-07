require 'sinatra'
require 'sinatra/reloader'
require 'pg'
also_reload('lib/**/*.rb')
require './lib/project'
require './lib/volunteer'
require 'pry'

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all
  erb(:index)
end

get('/projects') do
# project_name = params.fetch("proj_name")
# begin_date = params.fetch("begin_date")
# end_date = params.fetch("end_date")
@projects = Project.all
erb(:projects)
end

post('/project') do
  project_name = params.fetch("proj_name")
  begin_date = params.fetch("begin_date")
  end_date = params.fetch("end_date")
  project = Project.new({:proj_name => project_name, :begin_date => begin_date, :end_date => end_date, :id => nil})
  project.save
  erb(:project)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

post('/volunteers') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  joining_date = params.fetch("joining_date")
  leaving_date = params.fetch("leaving_date")
  volunteer = Volunteer.new({:first_name => first_name, :last_name => last_name, :joining_date => joining_date, :leaving_date => leaving_date})
  volunteer.save
  erb(:volunteers)
end
