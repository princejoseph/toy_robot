require 'spec_helper'

require 'toy_robot'
require 'command_finder'

RSpec.describe CommandFinder do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(robot) }

  describe '#determine_command_object' do
    let(:command_obj) { subject.determine_command_object(command) }

    context 'when command is place' do
      let(:command) { 'PLACE 1,2,NORTH' }

      it 'returns place command object' do
        expect(command_obj).to be_an_instance_of(Commands::PlaceCommand)
      end
    end

    context 'when command is move' do
      let(:command) { 'MOVE' }

      it 'returns move command object' do
        expect(command_obj).to be_an_instance_of(Commands::MoveCommand)
      end
    end

    context 'when command is left' do
      let(:command) { 'LEFT' }

      it 'returns left command object' do
        expect(command_obj).to be_an_instance_of(Commands::LeftCommand)
      end
    end

    context 'when command is right' do
      let(:command) { 'RIGHT' }

      it 'returns right command object' do
        expect(command_obj).to be_an_instance_of(Commands::RightCommand)
      end
    end

    context 'when command is report' do
      let(:command) { 'REPORT' }

      it 'returns report command object' do
        expect(command_obj).to be_an_instance_of(Commands::ReportCommand)
      end
    end

    context 'when command is exit' do
      let(:command) { 'EXIT' }

      it 'returns exit command object' do
        expect(command_obj).to be_an_instance_of(Commands::ExitCommand)
      end
    end

    context 'any other command' do
      let(:command) { 'A RANDOM COMMAND' }

      it 'returns exit command object' do
        expect(command_obj).to be_an_instance_of(Command)
      end
    end
  end
end
