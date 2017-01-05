require 'spec_helper'

require 'toy_robot'
require 'command'

RSpec.describe Command do
  let(:command) { 'A RANDOM COMMAND' }
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  describe '#execute' do
    it 'puts not implemented' do
      expect { subject.execute }.to output("Command not implemented\n").to_stdout
    end
  end

  describe '#exit?' do
    it 'is always false' do
      expect(subject.exit?).to be false
    end
  end
end
