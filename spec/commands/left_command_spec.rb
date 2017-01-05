require 'spec_helper'

require 'toy_robot'
require 'commands/left_command'

RSpec.describe Commands::LeftCommand do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  describe '#execute' do
    after { subject.execute }

    context 'valid command' do
      let(:command) { "LEFT" }

      it 'calls the turn_left method on robot' do
        expect(robot).to receive(:turn_left)
      end
    end

    context 'invalid command' do
      let(:command) { 'LEFT 123' }

      it 'will not call turn_left method' do
        expect(robot).not_to receive(:turn_left)
      end

      it 'will puts Left command format is not correct' do
        expect { subject.execute }.to output("Left command format is not correct\n").to_stdout
      end
    end
  end
end
