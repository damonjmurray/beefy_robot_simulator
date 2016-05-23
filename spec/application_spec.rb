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

    before do
      expect(application.robot.direction).to be_nil
      expect(application.table.item_at(2, 3)).to be_nil
    end

    it 'sets the robots direction' do
      subject
      expect(application.robot.direction).to eq 'NORTH'
    end

    it 'puts the robot in a position on the board' do
      subject
      expect(application.table.item_at(2, 2)).to be application.robot
    end

    context 'multiple place commands' do
      subject do
        application.place(2, 2, 'NORTH')
        application.place(2, 3, 'SOUTH')
      end

      it 'repositions the robot with each place' do
        subject
        robot_positions = application.table.positions.select do |p|
          p[:occupant] == application.robot
        end

        expect(robot_positions.size).to eq 1
      end
    end
  end
end
