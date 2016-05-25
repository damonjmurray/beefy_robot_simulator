require 'spec_helper'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe 'a robot' do
    it 'has a name' do
      expect(subject.name).to be
    end

    it 'is named BEEFY' do
      expect(subject.name).to eq 'BEEFY'
    end

    it 'has a direction' do
      expect(subject.direction).to be nil
    end
  end

  describe '#set_direction' do
    let(:direction) { Direction::SOUTH }
    subject { robot.set_direction(direction) }

    before { expect(robot.direction).to be nil }

    it "changes sets robot's direction" do
      subject
      expect(robot.direction).to eq direction
    end
  end

  describe '#move_from' do
    subject { robot.move_from(0, 0) }

    [
      { direction: Direction::NORTH, expected_result: { x: 0, y: 1 } },
      { direction: Direction::EAST, expected_result: { x: 1, y: 0 } },
      { direction: Direction::SOUTH, expected_result: { x: 0, y: -1 } },
      { direction: Direction::WEST, expected_result: { x: -1, y: 0 } }
    ].each do |expectation|
      context "when robot is facing #{expectation[:direction]}" do
        before { robot.set_direction(expectation[:direction]) }
        it { is_expected.to eq expectation[:expected_result] }
      end
    end
  end

  describe '#turn_left' do
    subject { robot.turn_left }

    [
      { current: Direction::NORTH, expected_result: Direction::WEST },
      { current: Direction::EAST, expected_result: Direction::NORTH },
      { current: Direction::SOUTH, expected_result: Direction::EAST },
      { current: Direction::WEST, expected_result: Direction::SOUTH }
    ].each do |direction|
      context "when robot is facing #{direction[:current]}" do
        before { robot.set_direction(direction[:current]) }
        it { is_expected.to eq direction[:expected_result] }
      end
    end

    context 'when the robots direction has not been set' do
      it 'does nothing' do
        subject
        expect(robot.direction).to be nil
      end
    end
  end

  describe '#turn_right' do
    subject { robot.turn_right }

    [
      { current: Direction::NORTH, expected_result: Direction::EAST },
      { current: Direction::EAST, expected_result: Direction::SOUTH },
      { current: Direction::SOUTH, expected_result: Direction::WEST },
      { current: Direction::WEST, expected_result: Direction::NORTH }
    ].each do |direction|
      context "when robot is facing #{direction[:current]}" do
        before { robot.set_direction(direction[:current]) }
        it { is_expected.to eq direction[:expected_result] }
      end
    end

    context 'when the robots direction has not been set' do
      it 'does nothing' do
        subject
        expect(robot.direction).to be nil
      end
    end
  end
end
