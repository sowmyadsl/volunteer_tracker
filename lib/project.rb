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
      proj_name = project.fetch("project_name")
      begin_date = project.fetch("begin_date")
      end_date = project.fetch("end_date")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:proj_name => proj_name, :begin_date => begin_date, :end_date => end_date, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (project_name, begin_date, end_date) VALUES ('#{@proj_name}','#{@begin_date}', '#{@end_date}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  define_method(:==) do |another_project|
    (self.proj_name.==(another_project.proj_name)).& (self.begin_date.==(another_project.begin_date)).& (self.end_date.==(another_project.end_date)).& (self.id.==(another_project.id))
  end

  define_singleton_method(:find) do |id|
    found_project = nil
    Project.all().each do |project|
      if project.id().==(id)
        found_project = project
      end
    end
    found_project
  end

  define_method(:update) do |attributes|
    @proj_name = attributes.fetch(:proj_name)
    @id = self.id()
    DB.exec("UPDATE projects SET project_name = '#{@proj_name}' WHERE id = #{@id};")
  end
end
