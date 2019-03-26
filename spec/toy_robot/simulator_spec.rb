require 'spec_helper'

RSpec.describe ToyRobot::Simulator do
  # 'table' is a new instance of the class Table
  let (:table) { ToyRobot::Table.new(5, 5) }
  # 'subject' is a new instance of the class Simulator
  subject { ToyRobot::Simulator.new(table) }

  it "places the robot onto a valid position" do
    # Creates a new instance of the Robot class with a position and direction
    expect(ToyRobot::Robot).to receive(:new)
      .with(0, 0, "NORTH")
      .and_return(double)
    # A method of the simulator which places the robot at a specific location direction
    subject.place(0, 0, 'NORTH')
    # There is a new instance of the robot for this instance of a the simulation
    expect(subject.robot).not_to be_nil
  end

  it "cannot place the robot onto an invalid position" do
    expect(ToyRobot::Robot).not_to receive(:new)
    subject.place(5, 5, 'NORTH')
    # Will not create a new instance of a robot if the place method returns false
    expect(subject.robot).to be_nil
  end

  context "when the robot has been placed" do
    # Create an instance of 'robot'
    let (:robot) { instance_double(ToyRobot::Robot) }
    # Ensure that the simulator has an instance of a robot to play with
    before { allow(subject).to receive(:robot).and_return(robot) }

    it "tells the robot to move" do
      expect(robot).to receive(:move)
      subject.move
    end

    it "tells the robot to turn left" do
      expect(robot).to receive(:turn_left)
      subject.turn_left
    end

    it "tells the robot to turn right" do
      expect(robot).to receive(:turn_right)
      subject.turn_right
    end

    it "tells the robot to report" do
      expect(robot).to receive(:report) { { north: 3, east: 3, direction: "NORTH" } }
      subject.report
    end


  end

end
