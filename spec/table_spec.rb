require 'spec_helper'

RSpec.describe Table do
  let(:table) { Table.new }
  let(:item) { Robot.new }

  describe 'a table' do
    it 'has 5 x-positions' do
      expect(subject.x_range.length).to eq 5
    end

    it 'has 5 y-positions' do
      expect(subject.y_range.length).to eq 5
    end

    context 'table positions' do
      it 'has a total of 25 positions' do
        expect(subject.positions.size).to eq 25
      end

      it 'has values for x, y and occupant in each position' do
        expect(subject.positions).to all include :x
        expect(subject.positions).to all include :y
        expect(subject.positions).to all include :occupant
      end
    end
  end

  describe '#set_item_at_position' do
    let(:x) { 2 }
    let(:y) { 3 }

    subject { table.set_item_at_position(item, x, y) }

    it 'sets the item as the occupant in the specified position' do
      subject
      position = table.positions.detect { |p| p[:x] == x && p[:y] == y }
      expect(position[:occupant]).to be item
    end

    context 'when position is invalid' do
      let(:x) { table.x_range.last * 2 }
      let(:y) { table.y_range.last * 2 }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end
  end

  describe '#item_at' do
    subject { table.item_at(x, y) }

    before { table.set_item_at_position(item, 0, 0) }

    context 'when position is invalid' do
      let(:x) { table.x_range.last * 2 }
      let(:y) { table.y_range.last * 2 }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'when position is valid' do
      let(:x) { 0 }
      let(:y) { 0 }
      it { is_expected.to be item }
    end
  end

  describe '#remove_item_at_position' do
    subject { table.remove_item_at_position(item, x, y) }

    context 'when item is in position' do
      let(:x) { 0 }
      let(:y) { 0 }

      before { table.set_item_at_position(item, x, y) }

      it 'removes the item from the position' do
        expect(table.item_at(x, y)).to be item
        subject
        expect(table.item_at(x, y)).to be nil
      end
    end

    context 'when position is invalid' do
      let(:x) { table.x_range.last * 2 }
      let(:y) { table.y_range.last * 2 }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end
  end

  describe '#valid_position' do
    subject { table.valid_position?(x, y) }

    context 'when both values are in range' do
      let(:x) { table.x_range.last }
      let(:y) { table.y_range.last }

      it { is_expected.to be true }
    end

    context 'when values are out of range' do
      let(:x) { table.x_range.last * 2 }
      let(:y) { table.y_range.last * 2 }

      it { is_expected.to be false }
    end
  end
end
