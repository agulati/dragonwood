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
end
