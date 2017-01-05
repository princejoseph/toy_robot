require 'spec_helper'

require 'toy_robot'
require 'commands/place_command'

RSpec.describe Commands::PlaceCommand do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  describe '#execute' do
    after { subject.execute }

    let(:x) { rand(0..4) }
    let(:y) { rand(0..4) }
    let(:direction) { %w(NORTH EAST SOUTH WEST).sample }

    let(:command) { "PLACE #{x},#{y},#{direction}" }

    context 'valid command' do
      it 'calls the place method on robot with correct arguements' do
        expect(robot).to receive(:place).with(x, y, direction)
      end
    end

    context 'invalid comment' do
      # making a invalid string to be the direction so that
      # command called is invalid
      let(:direction) { 'INVALIDDIRECTION' }

      it 'will not call place method' do
        expect(robot).not_to receive(:place)
      end

      it 'will puts Place command format is not correct' do
        expect { subject.execute }.to output("Place command format is not correct\n").to_stdout
      end
    end
  end
end
