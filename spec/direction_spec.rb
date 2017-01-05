require 'spec_helper'

require 'direction'

RSpec.describe Direction do
  subject { described_class.new(direction) }

  describe '#next' do
    let(:next_direction) { subject.next }

    context 'when direction is NORTH' do
      let(:direction) { 'NORTH'}

      it 'gives EAST as next' do
        expect(next_direction).to eq('EAST')
      end
    end

    context 'when direction is EAST' do
      let(:direction) { 'EAST'}

      it 'gives SOUTH as next' do
        expect(next_direction).to eq('SOUTH')
      end
    end

    context 'when direction is SOUTH' do
      let(:direction) { 'SOUTH'}

      it 'gives WEST as next' do
        expect(next_direction).to eq('WEST')
      end
    end

    context 'when direction is WEST' do
      let(:direction) { 'WEST'}

      it 'gives NORTH as next' do
        expect(next_direction).to eq('NORTH')
      end
    end
  end

  describe '#previous' do
    let(:pevious_direction) { subject.previous }

    context 'when direction is NORTH' do
      let(:direction) { 'NORTH' }

      it 'gives WEST as previous' do
        expect(pevious_direction).to eq('WEST')
      end
    end

    context 'when direction is EAST' do
      let(:direction) { 'EAST'}

      it 'gives NORTH as previous' do
        expect(pevious_direction).to eq('NORTH')
      end
    end

    context 'when direction is SOUTH' do
      let(:direction) { 'SOUTH'}

      it 'gives EAST as previous' do
        expect(pevious_direction).to eq('EAST')
      end
    end

    context 'when direction is WEST' do
      let(:direction) { 'WEST'}

      it 'gives SOUTH as previous' do
        expect(pevious_direction).to eq('SOUTH')
      end
    end
  end
end
