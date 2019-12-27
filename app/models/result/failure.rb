class Result::Failure
  attr_reader :errors

  def initialize(errors = nil)
    @errors = errors
  end

  def success?
    false
  end

  def failure?
    true
  end
end
