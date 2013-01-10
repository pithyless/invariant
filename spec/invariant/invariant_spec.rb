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

end
