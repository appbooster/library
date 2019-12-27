class Result::Success
  attr_reader :value

  def initialize(value = nil)
    @value = value
    freeze
  end

  def success?
    true
  end

  def failure?
    false
  end
end
