require 'spec_helper'

require 'position'

RSpec.describe Position do
  subject { described_class.new(x, y) }

  let(:table_length) { Position::TABLE_LENGTH }
  let(:table_breadth) { Position::TABLE_BREADTH }

  let(:x) { rand(0...table_length) }
  let(:y) { rand(0...table_breadth) }


  describe '#valid?' do
    context 'when x and y are inside table length and breadth' do
      it 'returns true' do
        expect(subject.valid?).to be true
      end
    end

    shared_examples 'expect valid to be false' do
      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    context 'when x is less than 0' do
      include_examples 'expect valid to be false' do
        let(:x) { rand(-100..-1) }
      end
    end

    context 'when x is greater than table length' do
      include_examples 'expect valid to be false' do
        let(:x) { table_length + rand(100) }
      end
    end

    context 'when x is equal to table length' do
      include_examples 'expect valid to be false' do
        let(:x) { table_length }
      end
    end

    context 'when y is less than 0' do
      include_examples 'expect valid to be false' do
        let(:y) { rand(-100..-1) }
      end
    end

    context 'when y is greater than table breadth' do
      include_examples 'expect valid to be false' do
        let(:y) { table_breadth + rand(100) }
      end
    end

    context 'when y is equal to table breadth' do
      include_examples 'expect valid to be false' do
        let(:y) { table_breadth }
      end
    end
  end

  describe '#next' do
    let(:next_position) { subject.next(direction) }

    context 'when direction is north' do
      let(:direction) { 'NORTH' }

      it 'gives new position with x and y + 1' do
        expect(next_position.x).to eq(x)
        expect(next_position.y).to eq(y + 1)
      end
    end

    context 'when direction is south' do
      let(:direction) { 'SOUTH' }

      it 'gives new position with x and y - 1' do
        expect(next_position.x).to eq(x)
        expect(next_position.y).to eq(y - 1)
      end
    end

    context 'when direction is west' do
      let(:direction) { 'WEST' }

      it 'gives new position with x - 1 and y' do
        expect(next_position.x).to eq(x - 1)
        expect(next_position.y).to eq(y)
      end
    end

    context 'when direction is east' do
      let(:direction) { 'EAST' }

      it 'gives new position with x + 1 and y' do
        expect(next_position.x).to eq(x + 1)
        expect(next_position.y).to eq(y)
      end
    end
  end
end
