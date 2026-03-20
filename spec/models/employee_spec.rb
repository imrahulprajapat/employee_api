require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is invalid without full_name" do
    emp = Employee.new(full_name: nil)
    expect(emp).not_to be_valid
  end
end
