require 'spec_helper'

require 'toy_robot'
require 'commands/right_command'

RSpec.describe Commands::RightCommand do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  describe '#execute' do
    after { subject.execute }

    context 'valid command' do
      let(:command) { "RIGHT" }

      it 'calls the turn_right method on robot' do
        expect(robot).to receive(:turn_right)
      end
    end

    context 'invalid command' do
      let(:command) { 'RIGHT 123' }

      it 'will not call turn_right method' do
        expect(robot).not_to receive(:turn_right)
      end

      it 'will puts Right command format is not correct' do
        expect { subject.execute }.to output("Right command format is not correct\n").to_stdout
      end
    end
  end
end
