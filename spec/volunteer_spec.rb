require "volunteer"
require "rspec"
require "helper_spec"

describe(Volunteer) do
  describe(".all") do
    it("is empty at first") do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe("#first_name") do
    it("lets you add a first name to volunteer") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer.first_name()).to(eq("Sowmya"))
    end
  end

  describe("#last_name") do
    it("lets you add a last name to volunteer") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer.last_name()).to(eq("Dinavahi"))
    end
  end

  describe("#joining_date") do
    it("lets you add a joining date to volunteer") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer.joining_date()).to(eq(2017-03-04))
    end
  end

  describe("#leaving_date") do
    it("lets you add a leaving date to volunteer") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer.leaving_date()).to(eq(2018-04-05))
    end
  end

  describe("#assigned_project_id") do
    it("lets you set a project ID to volunteer") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer.assigned_project_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same volunteer if it has the same first name, last name, joining date, leaving date and assigned project ID") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      test_volunteer2 = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer).to(eq(test_volunteer2))
    end
  end

end
