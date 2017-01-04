require 'spec_helper'

require 'position'
require 'direction'
require 'toy_robot'

RSpec.describe ToyRobot do
  subject { described_class.new }
  let(:table_length) { Position::TABLE_LENGTH }
  let(:table_breadth) { Position::TABLE_BREADTH }

  let(:x) { rand(0...table_length) }
  let(:y) { rand(0...table_breadth) }
  let(:direction) { %w(NORTH EAST SOUTH WEST).sample }

  describe '#place' do
    before { subject.place(x, y, direction) }

    context 'when placed within the table' do
      it 'sets the position and direction' do
        expect(subject.position.x).to eq(x)
        expect(subject.position.y).to eq(y)
        expect(subject.direction).to eq(direction)
      end
    end

    context 'when placed outside the table' do
      # making x greater than table length
      let(:x) { table_length + rand(100) }

      it 'will not set the position and direction' do
        expect(subject.position).to be_nil
        expect(subject.direction).to be_nil
      end
    end
  end

  describe '#move' do
    context 'when robot is already placed' do
      before { subject.place(x, y, direction) }
      before { subject.move }

      context 'when direction is WEST' do
        let(:direction) { 'WEST' }

        context 'next position is valid' do
          let(:x) { rand(1...table_length) }

          it 'sets position x as x-1' do
            expect(subject.position.x).to eq(x - 1)
            expect(subject.position.y).to eq(y)
          end
        end

        context 'next position is invalid' do
          let(:x) { 0 } # For 0, next position is invalid on west direction

          it 'does not change position' do
            expect(subject.position.x).to eq(x)
            expect(subject.position.y).to eq(y)
          end
        end
      end
    end

    context 'when robot is not placed' do
      before { subject.move }

      it 'will not set the position and direction as the robot is placed' do
        expect(subject.position).to be_nil
        expect(subject.direction).to be_nil
      end
    end
  end

  describe '#turn_left' do
    context 'when robot is already placed' do
      before { subject.place(x, y, direction) }
      before { subject.turn_left }

      context 'when robot is NORTH facing' do
        let(:direction) { 'NORTH' }

        it 'will turn the robot to WEST facing' do
          expect(subject.direction).to eq('WEST')
        end
      end

      context 'when robot is EAST facing' do
        let(:direction) { 'EAST' }

        it 'will turn the robot to NORTH facing' do
          expect(subject.direction).to eq('NORTH')
        end
      end

      context 'when robot is SOUTH facing' do
        let(:direction) { 'SOUTH' }

        it 'will turn the robot to EAST facing' do
          expect(subject.direction).to eq('EAST')
        end
      end

      context 'when robot is WEST facing' do
        let(:direction) { 'WEST' }

        it 'will turn the robot to WEST facing' do
          expect(subject.direction).to eq('SOUTH')
        end
      end
    end

    context 'when robot is not placed' do
      before { subject.turn_left }

      it 'will not set the position and direction as the robot is placed' do
        expect(subject.position).to be_nil
        expect(subject.direction).to be_nil
      end
    end
  end


  describe '#turn_right' do
    context 'when robot is already placed' do
      before { subject.place(x, y, direction) }
      before { subject.turn_right }

      context 'when robot is NORTH facing' do
        let(:direction) { 'NORTH' }

        it 'will turn the robot to EAST facing' do
          expect(subject.direction).to eq('EAST')
        end
      end

      context 'when robot is EAST facing' do
        let(:direction) { 'EAST' }

        it 'will turn the robot to SOUTH facing' do
          expect(subject.direction).to eq('SOUTH')
        end
      end

      context 'when robot is SOUTH facing' do
        let(:direction) { 'SOUTH' }

        it 'will turn the robot to WEST facing' do
          expect(subject.direction).to eq('WEST')
        end
      end

      context 'when robot is WEST facing' do
        let(:direction) { 'WEST' }

        it 'will turn the robot to NORTH facing' do
          expect(subject.direction).to eq('NORTH')
        end
      end
    end

    context 'when robot is not placed' do
      before { subject.turn_right }

      it 'will not set the position and direction as the robot is placed' do
        expect(subject.position).to be_nil
        expect(subject.direction).to be_nil
      end
    end
  end

  describe '#report' do
    context 'when robot is not placed' do
      it 'will puts Toy Robot not yet placed' do
        expect { subject.report }.to output("Toy Robot not yet placed\n").to_stdout
      end
    end

    context 'when robot is placed' do
      before { subject.place(x, y, direction) }

      it 'will report the x, y and direction of the robot' do
        expect { subject.report }.to output("#{x},#{y},#{direction}\n").to_stdout
      end
    end
  end
end
