require "singleton"

class Invariant
  include Singleton

  class AssertionError < StandardError
  end

  attr_accessor :failure_handler

  def self.enable_assertions
    failure_handler { |msg| raise AssertionError.new(msg) }
  end

  def self.disable_assertions
    failure_handler { }
  end

  def self.failure_handler(&block)
    instance.failure_handler = block
  end
end

Kernel.class_eval do
  def assert(first=nil, second=nil)
    if block_given?
      assert(yield, first)
    else
      Invariant.instance.failure_handler.call(second) unless first
    end
  end
end

Invariant.enable_assertions
