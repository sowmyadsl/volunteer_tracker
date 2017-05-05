class Volunteer
  attr_accessor(:first_name, :last_name, :joining_date ,:leaving_date, :assigned_project_id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @joining_date = attributes.fetch(:joining_date)
    @leaving_date = attributes.fetch(:leaving_date)
    @assigned_project_id = attributes.fetch(:assigned_project_id)
  end

  define_singleton_method(:all) do
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      joining_date = volunteer.fetch('joining_date')
      leaving_date = volunteer.fetch('leaving_date')
      assigned_project_id = volunteer.fetch('assigned_project_id').to_i
      volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :joining_date => joining_date, :leaving_date => leaving_date, :assigned_project_id => assigned_project_id}))
    end
    volunteers
  end

  define_method(:==) do |another_volunteer|
    self.first_name.==(another_volunteer.first_name).& (self.last_name.==(another_volunteer.last_name)).&(self.joining_date.==(another_volunteer.joining_date)).&(self.leaving_date.==(another_volunteer.leaving_date)).&(self.assigned_project_id.==(another_volunteer.assigned_project_id))
  end

  define_method(:save) do
    DB.exec("INSERT INTO volunteers (first_name, last_name, joining_date, leaving_date, assigned_project_id) VALUES ('#{@first_name}','#{@last_name}', '#{@joining_date}','#{@leaving_date}', #{@assigned_project_id});")
  end
end
