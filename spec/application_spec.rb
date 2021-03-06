require 'spec_helper'

RSpec.describe Application do
  let(:application) { Application.new }

  describe 'the application' do
    it 'has a robot' do
      expect(subject.robot).to be_a Robot
    end

    it 'has a table' do
      expect(subject.table).to be_a Table
    end
  end

  describe '#place' do
    subject { application.place(2,2,Direction::NORTH) }

    before do
      expect(application.robot.direction).to be_nil
      expect(application.table.item_at(2, 3)).to be_nil
    end

    it 'sets the robots direction' do
      subject
      expect(application.robot.direction).to eq Direction::NORTH
    end

    it 'puts the robot in a position on the board' do
      subject
      expect(application.table.item_at(2, 2)).to be application.robot
    end

    context 'multiple place commands' do
      subject do
        application.place(2, 2, Direction::NORTH)
        application.place(2, 3, Direction::SOUTH)
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

  describe '#report' do
    subject { application.report }

    context 'the robot is on the board' do
      before { application.place(2, 3, Direction::EAST) }

      it 'returns a string description of the robot location' do
        expect(subject).to eq '2,3,EAST'
      end
    end

    context 'the robot is not on the board' do
      it 'does nothing' do
        expect(subject).to be nil
      end
    end
  end

  ['left', 'right'].each do |direction|
    describe "##{direction}" do
      subject { application.send(direction.to_sym) }

      context 'the robot is on the board' do
        before { application.place(2, 3, Direction::NORTH) }

        it 'should turn the robot left' do
          allow(application.robot).to receive("turn_#{direction}".to_sym).once
          subject
        end
      end

      context 'the robot is not on the board' do
        before { expect(application.robot.direction).to be nil }

        it 'ignores the instruction to turn left' do
          allow(application.robot).to receive("turn_#{direction}".to_sym).exactly(0).times
          subject
          expect(application.robot.direction).to be nil
        end
      end
    end
  end

  describe '#move' do
    subject { application.move }
    let(:table) { application.table }
    let(:robot) { application.robot }

    context 'the robot is on the board' do
      before { application.place(2, 3, Direction::NORTH) }

      it 'should move the robot one position be to the NORTH' do
        expect(table.position_of(robot)[:x]).to eq 2
        expect(table.position_of(robot)[:y]).to eq 3
        subject
        expect(table.position_of(robot)[:x]).to eq 2
        expect(table.position_of(robot)[:y]).to eq 4
      end
    end
  end
end
