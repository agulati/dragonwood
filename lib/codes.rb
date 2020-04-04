module Codes

  # Turns
  TIME_TO_ACT       = 100
  DISCARD_REQUIRED  = 110

  def self.all
    constants.map { |c| { const_get(c) => c.to_s.downcase } }
  end
end
