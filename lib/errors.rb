module Errors
  class DragonwoodError < StandardError
    attr_reader :http_status

    def initialize (message:, http_status: :internal_server_error)
      super(message)
      set_backtrace(backtrace)
      @http_status = http_status
    end
  end

  class PasswordMismatchError < DragonwoodError
    def initialize
      super(message: "Password and confirmation must match.", http_status: :bad_request)
    end
  end

  class AuthenticationFailedError < DragonwoodError
    def initialize
      super(message: "Authentication Failed", http_status: :unauthorized)
    end
  end

  class ValidationError < DragonwoodError
    def initialize (exception)
      super(message: exception.message, http_status: :bad_request)
    end
  end

  class GameNotFoundError < DragonwoodError
    def initialize
      super(message: "Game Not Found", http_status: :not_found)
    end
  end

  class HandTooLargeError < DragonwoodError
    def initialize(max_cards:)
      super(message: "You have too many cards in your hand (max #{max_cards})", http_status: :failed_dependency)
    end
  end

  class InvalidStomp < DragonwoodError
    def initialize
      super(message: "All cards must have the same number for a Stomp attack.", http_status: :failed_dependency)
    end
  end

  class InvalidStrike < DragonwoodError
    def initialize
      super(message: "All cards must form a sequential series for a Strike attack.", http_status: :failed_dependency)
    end
  end

  class InvalidScream < DragonwoodError
    def initialize
      super(message: "All cards must have the same color for a Scream attack.", http_status: :failed_dependency)
    end
  end

  class CardNotInHandError < DragonwoodError
    def initialize(color:, value:)
      super(message: "You don't have the card #{color.titleize} #{value}", http_status: :failed_dependency)
    end
  end

  class CardNotOnBoard < DragonwoodError
    def initialize(card_type:, card_name:)
      super(message: "The #{card_type} Card '#{card_name}' is not on the Landscape", http_status: :failed_dependency)
    end
  end
end
