require 'spec_helper'

RSpec.describe Direction do
  describe '#valid?' do
    [:north, :east, :south, :west].each do |direction|
      context "given #{direction}" do
        subject { Direction::valid?(direction) }
        it { is_expected.to be true }
      end
    end

    context 'given an invalid direction' do
      subject { Direction::valid?(:invalid) }
      it { is_expected.to be false }
    end
  end

  describe '#left_from' do
    subject { Direction::left_from(direction) }

    [
      { current: Direction::NORTH, expected_result: Direction::WEST },
      { current: Direction::EAST, expected_result: Direction::NORTH },
      { current: Direction::SOUTH, expected_result: Direction::EAST },
      { current: Direction::WEST, expected_result: Direction::SOUTH }
    ].each do |direction|
      context "when robot is facing #{direction[:current]}" do
        let(:direction) { direction[:current] }
        it { is_expected.to eq direction[:expected_result] }
      end
    end
  end

  describe '#right_from' do
    subject { Direction::right_from(direction) }

    [
      { current: Direction::NORTH, expected_result: Direction::EAST },
      { current: Direction::EAST, expected_result: Direction::SOUTH },
      { current: Direction::SOUTH, expected_result: Direction::WEST },
      { current: Direction::WEST, expected_result: Direction::NORTH }
    ].each do |direction|
      context "when robot is facing #{direction[:current]}" do
        let(:direction) { direction[:current] }
        it { is_expected.to eq direction[:expected_result] }
      end
    end
  end
end
