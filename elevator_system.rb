require_relative 'elevator'

class ElevatorSystem
  attr_reader :elevator_count, :floor_count, :elevators, :queue

  def initialize(elevator_count:, floor_count:)
    @elevator_count = elevator_count
    @floor_count = floor_count
    @queue = []
    @elevators = Array.new(elevator_count) { Elevator.new }
    run
  end

  def elevator_request(floor:, direction:)
    queue.push({
      floor: floor,
      direction: direction
    })
  end

  def floor_request(floor)
    # Not implemented yet, but with the timer implemenation
    # would refactor to use just one request for floor and elevator.
  end

  private
    def assign_elevator(request)
      sorted_elevators = elevators.sort { | e_1, e_2 | e_1.floor <=> e_2.floor }
      # Not fully implemented, but would assign to closest elevator
      # going in the same direction or assign to one that would be
      # available for the request after finishing its queue.
    end

    def run
      Thread.new {
        while true
          unless queue.empty?
            assign_elevator(queue.shift)
          end

          sleep 0.1
        end
      }
    end
end

elevator_system = ElevatorSystem.new(elevator_count: 3, floor_count: 10)
elevator_system.elevator_request(floor: 1, direction: :up)
elevator_system.elevator_request(floor: 2, direction: :up)

while true
  # Run the elevator system.
end
