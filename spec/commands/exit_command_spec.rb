require 'spec_helper'

require 'toy_robot'
require 'commands/exit_command'

RSpec.describe Commands::ExitCommand do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  let(:command) { "EXIT" }

  describe '#execute' do
    context 'valid command' do
      it 'will puts Exiting...' do
        expect { subject.execute }.to output("Exitng...\n").to_stdout
      end
    end

    context 'invalid command' do
      let(:command) { 'EXIT 123' }

      it 'will puts Invalid command' do
        expect { subject.execute }.to output("Invalid command\n").to_stdout
      end
    end
  end

  describe '#exit?' do
    it 'is always true' do
      expect(subject.exit?).to be true
    end
  end
end
