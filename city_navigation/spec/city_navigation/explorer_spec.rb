require "spec_helper"

describe CityNavigation::Explorer do

  subject {CityNavigation::Explorer.new}

  it "starts exactly at the centre of the city" do
    expect(subject.east).to eq(0)
    expect(subject.north).to eq(0)
    expect(subject.direction).to eq("NORTH")
  end

  it "moves 3 blocks east" do
    3.times { subject.move_east }
    expect(subject.east).to eq(3)
  end

  it "moves 4 blocks east" do
    4.times { subject.move_east }
    expect(subject.east).to eq(4)
  end

  it "moves 3 blocks west" do
    3.times { subject.move_west }
    expect(subject.east).to eq(-3)
  end

  it "moves 4 blocks west" do
    4.times { subject.move_west }
    expect(subject.east).to eq(-4)
  end

  it "moves 3 blocks north" do
    3.times { subject.move_north }
    expect(subject.north).to eq(3)
  end

  it "moves 4 blocks north" do
    4.times { subject.move_north }
    expect(subject.north).to eq(4)
  end

  it "moves 3 blocks south" do
    3.times { subject.move_south }
    expect(subject.north).to eq(-3)
  end

  it "moves 4 blocks south" do
    4.times { subject.move_south }
    expect(subject.north).to eq(-4)
  end

  context "when facing north" do
    subject { CityNavigation::Explorer.new(0, 0, "NORTH") }

    it "moves north" do
      subject.move
      expect(subject.north).to eq(1)
    end

    it "turns left to face west" do
      subject.turn_left
      expect(subject.direction).to eq("WEST")
    end
#
#     it "turns right to face east" do
#       subject.turn_left
#       expect(subject.direction).to eq("EAST")
#     end
#
#     it "next move is to (0, 1)" do
#       expect(subject.next_move).to eq ([0, 1])
#     end
#   end
#
#   context "when facing south" do
#     subject { CityNavigation::Explorer.new(0, 0, "SOUTH") }
#
#     it "moves south" do
#       subject.move
#       expect(subject.north).to eq(-1)
#     end
#
#     it "turns left to face east" do
#       subject.turn_left
#       expect(subject.direction).to eq("EAST")
#     end
#
#     it "turns right to face west" do
#       subject.turn_left
#       expect(subject.direction).to eq("WEST")
#     end
#
#     it "next move is to (0, -1)" do
#       expect(subject.next_move).to eq ([0, -1])
#     end
#   end
#
#   context "when facing east" do
#     subject { CityNavigation::Explorer.new(0, 0, "EAST") }
#
#     it "moves east" do
#       subject.move
#       expect(subject.north).to eq(-1)
#     end
#
#     it "turns left to face north" do
#       subject.turn_left
#       expect(subject.direction).to eq("NORTH")
#     end
#
#     it "turns right to face south" do
#       subject.turn_left
#       expect(subject.direction).to eq("SOUTH")
#     end
#
#     it "next move is to (1, 0)" do
#       expect(subject.next_move).to eq ([1, 0])
#     end
#   end
#
#   context "when facing west" do
#     subject { CityNavigation::Explorer.new(0, 0, "WEST") }
#
#     it "moves west" do
#       subject.move
#       expect(subject.north).to eq(-1)
#     end
#
#     it "turns left to face south" do
#       subject.turn_left
#       expect(subject.direction).to eq("SOUTH")
#     end
#
#     it "turns right to face north" do
#       subject.turn_left
#       expect(subject.direction).to eq("NORTH")
#     end
#
#     it "next move is to (-1, 0)" do
#       expect(subject.next_move).to eq ([-1, 0])
#     end
  end
end
