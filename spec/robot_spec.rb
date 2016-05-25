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
    let(:direction) { 'SOUTH' }
    subject { robot.set_direction(direction) }

    before { expect(robot.direction).to be nil }

    it "changes sets robot's direction" do
      subject
      expect(robot.direction).to eq direction
    end
  end

  describe '#turn_left' do
    subject { robot.turn_left }

    [
      { current: 'NORTH', expected_result: 'WEST' },
      { current: 'EAST', expected_result: 'NORTH' },
      { current: 'SOUTH', expected_result: 'EAST' },
      { current: 'WEST', expected_result: 'SOUTH' }
    ].each do |direction|
      context "when robot is facing #{direction[:current]}" do
        before { robot.set_direction(direction[:current]) }
        it { is_expected.to eq direction[:expected_result] }
      end
    end
  end

  describe '#turn_right' do
    subject { robot.turn_right }

    [
      { current: 'NORTH', expected_result: 'EAST' },
      { current: 'EAST', expected_result: 'SOUTH' },
      { current: 'SOUTH', expected_result: 'WEST' },
      { current: 'WEST', expected_result: 'NORTH' }
    ].each do |direction|
      context "when robot is facing #{direction[:current]}" do
        before { robot.set_direction(direction[:current]) }
        it { is_expected.to eq direction[:expected_result] }
      end
    end
  end
end
