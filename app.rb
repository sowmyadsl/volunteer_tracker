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
@projects = Project.all
erb(:projects)
end

post('/projects') do
  project_name = params.fetch("proj_name")
  begin_date = params.fetch("begin_date")
  end_date = params.fetch("end_date")
  project = Project.new({:proj_name => project_name, :begin_date => begin_date, :end_date => end_date, :id => nil})
  project.save
  @projects = Project.all
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  erb(:project)
end

patch('/projects/:id') do
  proj_name = params.fetch("proj_name")
  begin_date = params.fetch("begin_date")
  end_date = params.fetch("end_date")
  @project = Project.find(params.fetch("id").to_i)
  @project.update({:proj_name => proj_name, :begin_date => begin_date, :end_date => end_date, :id => nil})
  @projects = Project.all
  erb(:project)
end

delete('/projects/:id')do
  @project = Project.find(params.fetch("id").to_i)
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:volunteers)
end

post('/volunteers') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  joining_date = params.fetch("joining_date")
  leaving_date = params.fetch("leaving_date")
  assigned_project_id = params.fetch("assigned_project_id")
  volunteer = Volunteer.new({:first_name => first_name, :last_name => last_name, :joining_date => joining_date, :leaving_date => leaving_date, :assigned_project_id => assigned_project_id, :id => nil})
  volunteer.save
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch("id").to_i)
  erb(:volunteer)
end

get('/volunteers/:id/edit') do
  @volunteer = Volunteer.find(params.fetch("id").to_i)
  @projects = Project.all
  erb(:volunteer)
end

patch("/volunteers/:id") do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  joining_date = params.fetch("joining_date")
  leaving_date = params.fetch("leaving_date")
  assigned_project_id = params.fetch("assigned_project_id")
  @volunteer = Volunteer.find(params.fetch("id").to_i)
  @volunteer.update({ :first_name => first_name, :last_name => last_name, :joining_date => joining_date, :leaving_date => leaving_date, :assigned_project_id => assigned_project_id})
  @volunteer = Volunteer.find(params.fetch("id").to_i)
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:volunteer)
end

delete("/volunteers/:id") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  if @volunteer
    @volunteer.delete()
  else
    "There is nothing to delete!"
  end
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:volunteers)
end
