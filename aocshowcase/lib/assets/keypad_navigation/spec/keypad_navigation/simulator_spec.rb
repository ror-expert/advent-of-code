require "spec_helper"

describe KeypadNavigation::Simulator do
  let(:keypad_grid) { KeypadNavigation::KeypadGrid.new(1, 1) }
  subject { KeypadNavigation::Simulator.new(keypad_grid) }

  it "places the explorer on to a valid position" do
    expect(KeypadNavigation::Explorer).to receive(:new)
      .with(0, 0, "NORTH")
      .and_return(double)
    subject.place(0, 0, "NORTH")
    expect(subject.explorer).not_to be_nil
  end

  it "cannot place the explorer on to an invalid position" do
    expect(KeypadNavigation::Explorer).not_to receive(:new)
    subject.place(-2, 1, "WEST")
    expect(subject.explorer).to be_nil
  end

  it "does not have the explorer placed by default" do
    expect(subject.explorer_placed?).to eq(false)
  end

  it "does not move the explorer" do
    expect { subject.move }.to_not raise_error
  end

  it "turning an unplaced explorer left does not cause an exception" do
    expect { subject.turn_left }.to_not raise_error
  end

  it "turning an unplaced explorer right does not cause an exception" do
    expect { subject.turn_right }.to_not raise_error
  end

  it "asking an unplaced explorer to report does not cause an exception" do
    expect { subject.report }.to_not raise_error
  end

  it "informs us when a command is invalid" do
    message = "'PLACE 1, 2, NORTH' is an invalid command\n"
    expect { subject.invalid("PLACE 1, 2, NORTH") }.to output(message).to_stdout
  end

  context "when explorer has been placed" do
    let(:explorer) { instance_double(KeypadNavigation::Explorer, next_move: [0, 0]) }
    before { allow(subject).to receive(:explorer).and_return(explorer)}

    it "tells the explorer to move" do
      expect(explorer).to receive(:move)
      subject.move
    end

    it "tells the explorer to turn left" do
      expect(explorer).to receive(:turn_left)
      subject.turn_left
    end

    it "tells the explorer to turn right" do
      expect(explorer).to receive(:turn_right)
      subject.turn_right
    end

    # it "tells the explorer to report" do
    #   expect(explorer).to receive(:report) { { east: 3, north: 3, direction: "NORTH" } }
    #   message = "Explorer is currently at (3, 3) and is facing NORTH\n"
    #   expect { subject.report }.to output(message).to_stdout
    # end

    it "has placed the explore" do
      expect(subject.explorer_placed?).to eq(true)
    end
  end

  context "explorer placed at top left of keypad (1) facing north" do
    before do
      subject.place(-1, 1, "NORTH")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (-1, 1) and is facing NORTH\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

  context "explorer placed at top left of keypad (1) facing west" do
    before do
      subject.place(-1, 1, "WEST")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (-1, 1) and is facing WEST\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

  context "explorer placed at top right of keypad (3) facing north" do
    before do
      subject.place(1, 1, "NORTH")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (1, 1) and is facing NORTH\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

  context "explorer placed at top right of keypad (3) facing west" do
    before do
      subject.place(1, 1, "EAST")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (1, 1) and is facing EAST\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

  context "explorer placed at bottom right of keypad (9) facing north" do
    before do
      subject.place(1, -1, "SOUTH")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (1, -1) and is facing SOUTH\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

  context "explorer placed at bottom right of keypad (9) facing east" do
    before do
      subject.place(1, -1, "EAST")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (1, -1) and is facing EAST\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

  context "explorer placed at bottom left of keypad (7) facing north" do
    before do
      subject.place(-1, -1, "SOUTH")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (-1, -1) and is facing SOUTH\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

  context "explorer placed at bottom left of keypad (7) facing west" do
    before do
      subject.place(-1, -1, "WEST")
    end

    it "cannot move past the keypad boundary" do
      subject.move
      message = "Explorer is currently at (-1, -1) and is facing WEST\n"
      expect { subject.report}.to output(message).to_stdout
    end
  end

end
