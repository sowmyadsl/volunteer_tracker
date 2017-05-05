class Project
  attr_accessor(:proj_name, :begin_date, :end_date, :id)

  def initialize(attributes)
    @proj_name = attributes.fetch(:proj_name)
    @begin_date = attributes.fetch(:begin_date)
    @end_date = attributes.fetch(:end_date)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      proj_name = project.fetch("proj_name")
      begin_date = project.fetch("begin_date")
      end_date = project.fetch("end_date")
      id = project.fetch("id").to_i
      projects.push(Project.new({:proj_name => proj_name, :begin_date => begin_date, :end_date => end_date, :id => id}))
    end
   projects
  end
end
