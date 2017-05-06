require "project"
require "rspec"
require "helper_spec"

describe(Project) do
  before() do
    Project.clear()
  end
end
describe('.all') do
    it('starts out with no projects') do
      expect(Project.all).to eq([])
    end
  end

  describe("#proj_name") do
  it("returns the project name") do
    test_project1 = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
    expect(test_project1.proj_name).to eq("Web Technologies")
  end
end

  describe("#begin_date") do
  it("returns the begin date of the project") do
    test_project1 = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
    expect(test_project1.begin_date).to eq("2017-03-04")
  end
end

describe("#end_date") do
  it("returns the end date of the project") do
    test_project1 = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
    expect(test_project1.end_date).to eq("2018-04-05")
  end
end

describe("#save") do
  it("saves the entered project into database") do
    test_project = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
    test_project.save
    expect(Project.all).to eq([test_project])
  end
end

describe("#==") do
  it("is of the same class, project") do
    test_project = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
    test_project1 = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
    expect(test_project).to eq(test_project1)
  end
end

describe(".find") do
    it("returns a project by its ID number") do
      test_project =  Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
      test_project.save()
      test_project2 = Project.new({:proj_name =>"Bew Technologies",:begin_date => "2017-06-09", :end_date => "2018-09-05", :id => nil})
      test_project2.save()
      expect(Project.find(test_project2.id())).to eq(test_project2)
    end
  end

  describe("#update") do
    it("lets you update projects in database") do
      test_project =  Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
      test_project.save
      test_project.update({:proj_name => "Robot Technologies"})
      expect(test_project.proj_name()).to eq("Robot Technologies")
  end
end

 describe("#delete") do
   it("lets you delete a project from the database") do
     test_project = Project.new({:proj_name =>"Web Technologies",:begin_date => "2017-03-04", :end_date => "2018-04-05", :id => nil})
     test_project.save()
     test_project2 = Project.new({:proj_name =>"Bew Technologies",:begin_date => "2017-06-09", :end_date => "2018-09-05", :id => nil})
     test_project2.save()
     test_project.delete()
     expect(Project.all()).to eq([test_project2])
   end
 end
