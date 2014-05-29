require 'spec_helper'

describe Invariant do

  describe '::disable_assertions' do
    it 'disables assertions' do
      Invariant.disable_assertions
      assert(false).should be_nil
    end
  end

  describe '::disable_assertions' do
    it 'enables assertions' do
      Invariant.enable_assertions
      expect{ assert false }.to raise_error Invariant::AssertionError
    end
  end

  describe '::failure_handler' do
    it 'calls the block with assertion failures' do
      block = Proc.new {}
      block.should_receive(:call).with("some message")

      Invariant.failure_handler(&block)

      expect { assert(false, "some message") }.not_to raise_error
    end
  end

end
