require 'spec_helper'

RSpec.describe Table do
  describe 'a table' do
    it 'has 5 x-positions' do
      expect(subject.x_range.length).to eq 5
    end

    it 'has 5 y-positions' do
      expect(subject.y_range.length).to eq 5
    end

    it 'has 25 positions' do
      expect(subject.positions.size).to eq 25
    end

    context 'all table positions' do
      it 'has values for x, y and occupant' do
        expect(subject.positions).to all include :x
        expect(subject.positions).to all include :y
        expect(subject.positions).to all include :occupant
      end
    end
  end
end
