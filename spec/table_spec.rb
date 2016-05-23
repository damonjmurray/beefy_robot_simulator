require 'spec_helper'

RSpec.describe Table do
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
    let(:table) { Table.new }
    let(:item) { Robot.new }

    subject { table.set_item_at_position(item, 2, 3) }

    it 'sets the item as the occupant in the specified position' do
      subject
      position = table.positions.detect { |p| p[:x] == 2 && p[:y] == 3 }
      expect(position[:occupant]).to be item
    end
  end
end
