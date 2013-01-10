module Invariant
  class AssertionError < StandardError
  end

  def self.enable_assertions
    Kernel.class_eval do
      def assert(first=nil, second=nil)
        if block_given?
          assert(yield, first)
        else
          raise AssertionError, second unless first
        end
      end
    end
  end

  def self.disable_assertions
    Kernel.class_eval do
      def assert(*args, &block)
      end
    end
  end
end

Invariant.enable_assertions
