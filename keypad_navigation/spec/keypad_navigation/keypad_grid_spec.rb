require "spec_helper"

describe KeypadNavigation::KeypadGrid do
  subject { KeypadNavigation::KeypadGrid.new(1000,1000) }

  context "valid_location?" do
    it {should be_valid_location(0,0) }
    it {should be_valid_location(600,600) }
    it {should be_valid_location(-500,-500) }
    it {should_not be_valid_location(2000,2000) }
    it {should_not be_valid_location(-1500,1500) }
  end
end
