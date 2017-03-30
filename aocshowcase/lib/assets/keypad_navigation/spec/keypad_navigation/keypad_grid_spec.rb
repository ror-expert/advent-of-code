require "spec_helper"

describe KeypadNavigation::KeypadGrid do
  subject { KeypadNavigation::KeypadGrid.new(1,1) }

  context "valid_location?" do
    it {should be_valid_location(0,0) }
    it {should be_valid_location(1,1) }
    it {should be_valid_location(-1,-1) }
    it {should_not be_valid_location(-5,1) }
    it {should_not be_valid_location(0,2) }
  end
end
