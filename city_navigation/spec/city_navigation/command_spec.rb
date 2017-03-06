require 'spec_helper'

describe CityNavigation::Command do
  context "PLACE" do
    it "processes a PLACE command" do
      command, *args = CityNavigation::Command.process("PLACE 1,2,NORTH")
      expect(command).to eq(:place)
      expect(args).to eq([1, 2, "NORTH"])
    end

    it "returns :invalid for an invalid PLACE command" do
      command = CityNavigation::Command.process("PLACE 1, 2, NORTH")
      expect(command).to eq([:invalid, "PLACE 1, 2, NORTH"])
    end
  end

  context "MOVE" do
    it "processes the command" do
      command, *args = CityNavigation::Command.process("MOVE")
      expect(command).to eq(:move)
      expect(args).to be_empty
    end
  end

  



end
