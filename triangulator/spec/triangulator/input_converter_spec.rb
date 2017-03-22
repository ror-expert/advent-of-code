require 'spec_helper'

describe Triangulator::InputConverter do

  let(:raw_input) { (File.absolute_path("spec/fixtures/test_raw_input.txt"))}

  subject { Triangulator::InputConverter.new(raw_input)}

  it "converts raw_input into machine-readable input" do
    expect(subject.convert_measurements).to eq("""4,21,894\n419,794,987\n424,797,125\n651,305,558\n655,631,963\n""")
  end

end
