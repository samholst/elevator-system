class Elevator
  attr_reader :request_completed?, :target_floor, :current_direction, :current_floor, :queue

  def initialize
    @current_floor = 0
    @queue = []
  end

  def register_request(target_floor: , direction:)
    request = {
      target_floor: target_floor,
      direction: direction
    }

    @queue.push(request) unless request_already_in_queue?request)
  end

  def request_count
    @queue.size
  end

  private
    def start
      Thread.new do
        while true
          completed_request = find_completed_request

          remove_request(completed_request) if completed_request

          sleep 0.2
        end
      end
    end

    def find_completed_request
      @queue.find { | request | request.target_floor == current_floor }
    end

    def request_already_in_queue?(request)
      !@queue.find do | queued_request |
        queued_request == request
      end.nil?
    end

    def remove_request(request)
      @queue.delete_if do | queued_request |
        queued_request == new_request
      end
    end
end
