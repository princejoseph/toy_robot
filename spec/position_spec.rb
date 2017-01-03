require 'spec_helper'

require_relative '../lib/position'

RSpec.describe Position do
  describe '#valid?' do
    subject { described_class.new(x, y) }

    let(:table_length) { TABLE_DIMENSIONS[:length] }
    let(:table_breadth) { TABLE_DIMENSIONS[:breadth] }

    let(:x) { rand(0...table_length) }
    let(:y) { rand(0...table_breadth) }

    context 'when x and y are inside table length and breadth' do
      it 'returns true' do
        expect(subject.valid?).to be true
      end
    end

    context 'when x is less than 0' do
      let(:x) { rand(-100..-1) }

      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    context 'when x is greater than table length' do
      let(:x) { table_length + rand(100) }

      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    context 'when x is equal to table length' do
      let(:x) { table_length }

      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    context 'when y is less than 0' do
      let(:y) { rand(-100..-1) }

      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    context 'when y is greater than table breadth' do
      let(:y) { table_breadth + rand(100) }

      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    context 'when y is equal to table breadth' do
      let(:y) { table_breadth }

      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end
  end
end
