require "project"
require "rspec"
require "helper_spec"

describe('.all') do
    it('starts out with no projects') do
      expect(Project.all).to eq([])
    end
  end

  describe("#proj_name") do
  it("returns the project name") do
    test_project1 = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", id: nil})
    expect(test_project1.proj_name).to eq("Web Technologies")
  end
end

  describe("#begin_date") do
  it("returns the begin date of the project") do
    test_project1 = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", id: nil})
    expect(test_project1.begin_date).to eq("2017-03-04")
  end
end
  describe("#end_date") do
  it("returns the end date of the project") do
    test_project1 = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", id: nil})
    expect(test_project1.end_date).to eq("2018-04-05")
  end
end
