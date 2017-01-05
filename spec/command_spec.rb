require 'spec_helper'

require 'toy_robot'
require 'command'

RSpec.describe Command do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  describe '#execute' do
    context 'robot commands' do
      after { subject.execute }

      context 'place command' do
        let(:x) { rand(0..4) }
        let(:y) { rand(0..4) }
        let(:direction) { %w(NORTH EAST SOUTH WEST).sample }

        let(:command) { "PLACE #{x},#{y},#{direction}" }

        it 'calls the place method on robot with correct arguements' do
          expect(robot).to receive(:place).with(x, y, direction)
        end
      end

      context 'move command' do
        let(:command) { 'MOVE' }

        it 'calls the move method on robot' do
          expect(robot).to receive(:move)
        end
      end

      context 'left command' do
        let(:command) { 'LEFT' }

        it 'calls the turn_left method on robot' do
          expect(robot).to receive(:turn_left)
        end
      end

      context 'right command' do
        let(:command) { 'RIGHT' }

        it 'calls the turn_right method on robot' do
          expect(robot).to receive(:turn_right)
        end
      end

      context 'report command' do
        let(:command) { 'REPORT' }

        it 'calls the report method on robot' do
          expect(robot).to receive(:report)
        end
      end
    end

    context 'other general commands' do
      context 'exit command' do
        let(:command) { 'EXIT' }

        it 'puts Exiting...' do
          expect { subject.execute }.to output("Exiting....\n").to_stdout
        end
      end

      context 'any other command' do
        let(:command) { 'THIS IS A RANDOM COMMAND' }

        it 'will not set the type the subject' do
          expect { subject.execute }.to output("Please enter a valid command\n").to_stdout
        end
      end
    end
  end
end
