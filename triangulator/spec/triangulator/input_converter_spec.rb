require 'spec_helper'

describe Triangulator::InputConverter do

  let(:raw_input) { File.read(File.absolute_path("spec/fixtures/testing_raw_input.txt"))}

  subject { Triangulator::InputConverter.new(raw_input)}

  it "converts raw_input into machine-readable input" do
    expect(subject.convert_measurements).to eq({"T0"=>["4", "21", "894"], "T1"=>["419", "794", "987"], "T2"=>["424", "797", "125"], "T3"=>["651", "305", "558"], "T4"=>["655", "631", "963"]})
  end

end
