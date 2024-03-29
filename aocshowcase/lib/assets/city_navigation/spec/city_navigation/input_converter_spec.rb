require 'spec_helper'

describe CityNavigation::InputConverter do

  let(:raw_input) { File.read(File.absolute_path("spec/fixtures/input_test.txt"))}

  subject { CityNavigation::InputConverter.new(raw_input)}

  it "converts the raw input into city directions" do
    expect(subject.convert_directions).to eq(["PLACE, 0, 0, NORTH", "RIGHT", "MOVE", "MOVE", "REPORT", "LEFT", "MOVE", "REPORT", "RIGHT", "MOVE", "MOVE", "REPORT"])
  end
end
