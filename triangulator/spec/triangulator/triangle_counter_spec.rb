require 'spec_helper'

describe Triangulator::TriangleCounter do

  let(:machine_readable_input) {(File.absolute_path("spec/fixtures/test_machine_readable_input.txt"))}

  subject {Triangulator::TriangleCounter.new(machine_readable_input)}

  it "counts the number of valid triangles from the input" do
    expect(subject.count_valid_triangles).to eq(3)
  end
end
