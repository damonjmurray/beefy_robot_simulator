require 'spec_helper'

RSpec.describe Application do
  describe 'the application' do
    it 'has a robot' do
      expect(subject.robot).to be_a Robot
    end

    it 'has a table' do
      expect(subject.table).to be_a Table
    end
  end

  describe '#place' do
    let(:application) { Application.new }
    subject { application.place(2,2,'NORTH') }

    it 'sets the robots direction' do
      expect(application.robot.direction).to be nil
      subject
      expect(application.robot.direction).to be 'NORTH'
    end

    it 'puts the robot in a position on the board' do

    end
  end
end
