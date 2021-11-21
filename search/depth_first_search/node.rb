require 'securerandom'

class Node

  attr_accessor :id, :value, :leaves

  def initialize(value)
    @id = SecureRandom.alphanumeric(10)
    @value = value
    @leaves = []
  end
end
