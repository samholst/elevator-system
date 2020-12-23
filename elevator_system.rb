require_relative 'elevator'

class ElevatorSystem
  attr_accessor :elevator_count, :floor_count
  attr_reader :elevators, :queue

  def initialize(elevator_count:, floor_count:)
    @elevator_count = elevator_count
    @floor_count = floor_count
    @queue = []
  end

  def elevator_request(floor:, direction:)
    @queue.push({ floor: floor, direction: direction })
  end

  def floor_request(floor)
  end

  def start
    while true
      if queue_has_a_request?
        assign_elevator
      end

      sleep 0.1
    end
  end

  private
    def assign_elevator
    end

    def queue_has_a_request?
      @queue.length > 0
    end
end

puts ElevatorSystem.new(elevator_count: 3, floor_count: 10).inspect
