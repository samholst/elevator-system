require_relative 'elevator'

class ElevatorSystem
  attr_accessor :elevator_count, :floor_count

  def initialize(elevator_count:, floor_count:)
    @elevator_count = elevator_count
    @floor_count = floor_count
  end

  def elevator_request(floor:, direction:)
  end

  def floor_request(floor)
  end
end

puts ElevatorSystem.new(elevator_count: 3, floor_count: 10).inspect
