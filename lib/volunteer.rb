class Volunteer
  attr_accessor(:first_name, :last_name, :joining_date ,:leaving_date, :assigned_project_id, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @joining_date = attributes.fetch(:joining_date)
    @leaving_date = attributes.fetch(:leaving_date)
    @assigned_project_id = attributes.fetch(:assigned_project_id)
    @id = attributes.fetch(:id)
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
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :joining_date => joining_date, :leaving_date => leaving_date, :assigned_project_id => assigned_project_id, :id => id}))
    end
    volunteers
  end

  define_method(:==) do |another_volunteer|
    self.first_name.==(another_volunteer.first_name).& (self.last_name.==(another_volunteer.last_name)).& (self.joining_date.==(another_volunteer.joining_date)).& (self.leaving_date.==(another_volunteer.leaving_date)).& (self.assigned_project_id.==(another_volunteer.assigned_project_id)).&
    (self.id.==(another_volunteer.id))
  end

  define_method(:save) do
    DB.exec("INSERT INTO volunteers (first_name, last_name, joining_date, leaving_date, assigned_project_id) VALUES ('#{@first_name}','#{@last_name}', '#{@joining_date}','#{@leaving_date}', #{@assigned_project_id});")
  end

  define_singleton_method(:find) do |id|
    found_volunteer = nil
    Volunteer.all().each do |volunteer|
      if volunteer.id().==(id)
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  define_method(:update) do |attributes|
    @id = self.id
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @joining_date = attributes.fetch(:joining_date)
    @leaving_date = attributes.fetch(:leaving_date)
    @project_id = attributes.fetch(:assigned_project_id).to_i
    DB.exec("UPDATE volunteers SET (first_name, last_name, joining_date, leaving_date, assigned_project_id) = ('#{@first_name}','#{@last_name}','#{@joining_date}','#{@leaving_date}', #{@project_id}) WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
  end
end
