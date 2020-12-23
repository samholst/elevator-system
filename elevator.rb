class Elevator
  attr_reader :request_completed?, :target_floor, :direction, :current_floor

  def initialize
    @current_floor = 0
    @queue = []
  end

  def start_request(target_floor: , direction:)
    @target_floor = target_floor
    @direction = direction
  end

  private
    def start
      Thread.new do
        while true
          completed_requests = has_completed_any_requests

          if completed_requests.any?
            completed_requests.each do | request |

            end
          end

          sleep 0.2
        end
      end
    end

    def has_completed_any_requests?
      @queue.select { | request | request_completed?(request_completed) }
    end

  def request_completed?(request)
    request.target_floor == current_floor
  end
end
