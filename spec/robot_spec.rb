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
end
