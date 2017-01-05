require 'spec_helper'

require 'toy_robot'
require 'commands/move_command'

RSpec.describe Commands::MoveCommand do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  describe '#execute' do
    after { subject.execute }

    context 'valid command' do
      let(:command) { "MOVE" }

      it 'calls the move method on robot' do
        expect(robot).to receive(:move)
      end
    end

    context 'invalid command' do
      let(:command) { 'MOVE 123' }

      it 'will not call move method' do
        expect(robot).not_to receive(:move)
      end

      it 'will puts Move command format is not correct' do
        expect { subject.execute }.to output("Move command format is not correct\n").to_stdout
      end
    end
  end
end
