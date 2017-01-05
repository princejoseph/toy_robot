require 'spec_helper'

require 'toy_robot'
require 'commands/report_command'

RSpec.describe Commands::ReportCommand do
  let(:robot) { ToyRobot.new }
  subject { described_class.new(command, robot) }

  describe '#execute' do
    after { subject.execute }

    context 'valid command' do
      let(:command) { "REPORT" }

      it 'calls the report method on robot' do
        expect(robot).to receive(:report)
      end
    end

    context 'invalid command' do
      let(:command) { 'REPORT 123' }

      it 'will not call report method' do
        expect(robot).not_to receive(:report)
      end

      it 'will puts Report command format is not correct' do
        expect { subject.execute }.to output("Report command format is not correct\n").to_stdout
      end
    end
  end
end
