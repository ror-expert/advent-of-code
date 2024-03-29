require 'spec_helper'

describe KeypadNavigation::CLI do
  subject { KeypadNavigation::CLI.new}

  context "load commands" do
    it "loads commands from a file" do
      path = File.dirname(__FILE__) + "/../fixtures/spec_converted_keypad_directions.txt"
      commands = subject.load_commands(path)
      expect(commands).to eq([
        [:place, 0,0, "NORTH"],
        [:move_up],
        [:move_left],
        [:move_left],
        [:report],
        [:move_right],
        [:move_right],
        [:move_down],
        [:move_down],
        [:move_down],
        [:report],
        [:move_left],
        [:move_up],
        [:move_right],
        [:move_down],
        [:move_left],
        [:report],
        [:move_up],
        [:move_up],
        [:move_up],
        [:move_up],
        [:move_down],
        [:report]
      ])
    end
  end

  context "run" do
    let(:simulator) { instance_double(KeypadNavigation::Simulator) }

    before do
      allow(subject).to receive(:simulator) { simulator }
    end

    context "place command" do
      it "passes a place command to the simulator" do
        expect(simulator).to receive(:place).with(0, 0, "NORTH")
        subject.run([[:place, 0, 0, "NORTH"]])
      end
    end

    context "move command" do
      it "passes the move command to the simulator" do
        expect(simulator).to receive(:move)
        subject.run([[:move]])
      end
    end

    context "left command" do
      it "passes the left command to the simulator" do
        expect(simulator).to receive(:turn_left)
        subject.run([[:turn_left]])
      end
    end

    context "right command" do
      it "passes the right command to the simulator" do
        expect(simulator).to receive(:turn_right)
        subject.run([[:turn_right]])
      end
    end

    context "report command" do
      it "passes the report command to the simulator" do
        expect(simulator).to receive(:report)
        subject.run([[:report]])
      end
    end

  end
end
