# Toy Robot Simulator
[![CircleCI](https://circleci.com/gh/princejoseph/toy_robot.svg?style=shield)](https://circleci.com/gh/princejoseph/toy_robot)
[![Code Climate](https://codeclimate.com/github/princejoseph/toy_robot/badges/gpa.svg)](https://codeclimate.com/github/princejoseph/toy_robot)
[![Test Coverage](https://codeclimate.com/github/princejoseph/toy_robot/badges/coverage.svg)](https://codeclimate.com/github/princejoseph/toy_robot/coverage)
[![Issue Count](https://codeclimate.com/github/princejoseph/toy_robot/badges/issue_count.svg)](https://codeclimate.com/github/princejoseph/toy_robot)

Toy Robot Simulator in Ruby

## Setup

1. Make sure you have ruby >= 2.3
2. Install the bundler gem by running:

   ```gem install bundler```

3. Clone the repo:

   ```git clone git@github.com:princejoseph/toy_robot.git```

4. Change to application directory:

   ```cd toy_robot```

5. Install dependencies:

   ```bundle install```

## Usage

* Run `ruby simulator.rb` from the application directory.
* This will fire up a [irb](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) like console
* In the console, we will be able to enter the commands for the toy robot.

## Description

* The application is a simulation of a toy robot moving
on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table,
but must be prevented from falling to destruction.
Any movement that would result in the robot falling
from the table must be prevented, however further
valid movement commands must still be allowed.

## Details

The application will be able read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* `PLACE` will put the toy robot on the table in position X,Y
and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
* The origin (0,0) can be considered to be the `SOUTH WEST` most corner.
* The first valid command to the robot is a `PLACE` command,
after that, any sequence of commands may be issued, in any order,
including another `PLACE` command.
The application should discard all commands in the sequence
until a valid `PLACE `command has been executed.
* `MOVE` will move the toy robot one unit forward
in the direction it is currently facing.
* `LEFT` and `RIGHT` will rotate the robot 90 degrees
in the specified direction
without changing the position of the robot.
* `REPORT` will announce the X,Y and F of the robot.

## Constraints

The toy robot must not fall off the table during movement.
This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

```
# Example a
PLACE 0,0,NORTH
MOVE
REPORT
# Output: 0,1,NORTH
```


```
# Example b
PLACE 0,0,NORTH
LEFT
REPORT
# Output: 0,0,WEST
```


```
# Example c
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
# Output: 3,3,NORTH
```
