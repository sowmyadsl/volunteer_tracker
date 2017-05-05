require "project"
require "rspec"
require "helper_spec"

describe('.all') do
    it('starts out with no projects') do
      expect(Project.all).to eq([])
    end
  end
