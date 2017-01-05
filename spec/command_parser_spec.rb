require 'spec_helper'

require 'command_parser'

RSpec.describe CommandParser do
  subject { described_class.new(command) }

  describe '#parse' do
    before { subject.parse }

    context 'place command' do
      let(:x) { rand(0..4) }
      let(:y) { rand(0..4) }
      let(:direction) { %w(NORTH EAST SOUTH WEST).sample }

      let(:command) { "PLACE #{x},#{y},#{direction}" }

      it 'sets the type, x, y, direction of the subject' do
        expect(subject.type).to eq(:place)
        expect(subject.x).to eq(x)
        expect(subject.y).to eq(y)
        expect(subject.direction).to eq(direction)
      end
    end

    context 'move command' do
      let(:command) { 'MOVE' }

      it 'sets the type the subject' do
        expect(subject.type).to eq(:move)
      end
    end

    context 'left command' do
      let(:command) { 'LEFT' }

      it 'sets the type the subject' do
        expect(subject.type).to eq(:left)
      end
    end

    context 'right command' do
      let(:command) { 'RIGHT' }

      it 'sets the type the subject' do
        expect(subject.type).to eq(:right)
      end
    end

    context 'report command' do
      let(:command) { 'REPORT' }

      it 'sets the type the subject' do
        expect(subject.type).to eq(:report)
      end
    end

    context 'exit command' do
      let(:command) { 'EXIT' }

      it 'sets the type the subject' do
        expect(subject.type).to eq(:exit)
      end
    end

    context 'any other command' do
      let(:command) { 'THIS IS A RANDOM COMMAND' }

      it 'will not set the type the subject' do
        expect(subject.type).to be_nil
      end
    end
  end
end
