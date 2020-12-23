class Elevator
  attr_reader :direction, :floor, :queue

  def initialize
    @floor = 0
    @queue = []
    @direction = :up
    run
  end

  def register_request(target_floor: , direction:)
    request = { target_floor: target_floor }

    queue.push(request) unless request_already_in_queue?(request)

    @direction = direction if request_count.zero?
  end

  def request_count
    queue.size
  end

  private
    def run
      # Not fully completed
      Thread.new {
        while true
          remove_request(completed_request) if completed_request = find_completed_request

          change_floor

          sleep 0.2
        end
      }
    end

    def find_completed_request
      queue.find { | request | request.target_floor == current_floor }
    end

    def request_already_in_queue?(request)
      !queue.find { | queued_request | queued_request == request }.nil?
    end

    def remove_request(request)
      queue.delete_if { | queued_request | queued_request == request }
    end

    def change_floor
      return if request_count.zero?

      direction == :up ? @floor += 1 : @floor -= 1
    end
end
