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
    it("lets you give it a first name to volunteer") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer.first_name()).to(eq("Sowmya"))
    end
  end

  describe("#last_name") do
    it("lets you give it a last name to volunteer") do
      test_volunteer = Volunteer.new({:first_name => "Sowmya", :last_name =>"Dinavahi", :joining_date => 2017-03-04, :leaving_date => 2018-04-05, :assigned_project_id => 1})
      expect(test_volunteer.last_name()).to(eq("Dinavahi"))
    end
  end
end
