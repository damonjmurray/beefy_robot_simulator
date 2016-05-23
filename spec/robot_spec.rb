require 'spec_helper'

RSpec.describe Robot do
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

  describe '#change_direction' do
    let(:robot) { Robot.new }
    let(:new_direction) { 'SOUTH' }
    subject { robot.change_direction(new_direction) }

    before { expect(robot.direction).to be nil }

    it "changes the robot's direction" do
      subject
      expect(robot.direction).to eq new_direction
    end
  end
end
