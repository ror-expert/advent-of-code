require 'spec_helper'

describe CityNavigation::CLI do
  subject { CityNavigation::CLI.new}

  context "load commands" do
    it "loads commands from a file" do
      path = FILE.dirname(__FILE__) + "/../fixtures/commands.txt"
      commands = subject.load_commands(path)
      expect(commands).to eq()
    end
  end
end
