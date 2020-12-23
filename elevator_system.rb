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
    # Not implemented yet
  end

  private
    def assign_elevator(request)
      sorted_elevators = elevators.sort { | e_1, e_2 | e_1.floor <=> e_2.floor }
      # Not fully implemented
    end

    def run
      Thread.new {
        while true

          unless queue.empty?
            assign_elevator(queue.delete(0))
          end

          sleep 0.1
        end
      }
    end
end

elevator_system = ElevatorSystem.new(elevator_count: 3, floor_count: 10)
elevator_system.elevator_request(floor: 1, direction: :up)
elevator_system.elevator_request(floor: 2, direction: :up)
