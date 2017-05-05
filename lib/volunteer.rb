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
    returned_volunteers = DB.exec("SELECT * FROM volunteer;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      joining_date = volunteer.fetch('joining_date')
      leaving_date = volunteer.fetch('leaving_date')
    end
    volunteers
  end
end
