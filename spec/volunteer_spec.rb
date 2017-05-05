require "volunteer"
require "rspec"
require "helper_spec"

describe(Volunteer) do
  describe(".all") do
    it("is empty at first") do
      expect(Volunteer.all()).to(eq([]))
    end
  end
end
