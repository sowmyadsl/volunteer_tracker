require 'sinatra'
require 'sinatra/reloader'
require 'pg'
also_reload('lib/**/*.rb')
require './lib/project'
require './lib/volunteer'
require 'pry'

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all()
  erb(:index)
end

get('/projects') do
# project_name = params.fetch("proj_name")
# begin_date = params.fetch("begin_date")
# end_date = params.fetch("end_date")
@projects = Project.all()
erb(:projects)
end
