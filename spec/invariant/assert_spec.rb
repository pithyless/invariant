require 'spec_helper'

describe 'Invariant Assertion' do

  before :each do
    Invariant.enable_assertions
  end

  describe 'assert' do

    context 'without message' do
      it 'fails when condition is false' do
        expect{ assert false }.to raise_error Invariant::AssertionError
      end

      it 'fails when condition evaluates to false' do
        expect{ assert nil }.to raise_error Invariant::AssertionError
      end

      it 'returns nil when condition is true' do
        expect{ assert true }.to_not raise_error Invariant::AssertionError
        assert(true).should be_nil
      end

      it 'returns nil when condition evaluates to true' do
        expect{ assert 'This evaluates to true' }.to_not raise_error Invariant::AssertionError
        assert('This evaluates to true').should be_nil
      end
    end

    context 'with message' do
      it 'raises error with specified message when condition evaluates to false' do
        expect{ assert nil, 'The error message' }.to raise_error(Invariant::AssertionError, 'The error message')
      end

      it 'returns nil without error when condition evaluates to true' do
        expect{ assert 'This evaluates to true', 'The error message' }.to_not raise_error(Invariant::AssertionError)
        assert('This evaluates to true').should be_nil
      end
    end

    context 'block invariant without message' do
      it 'invokes block' do
        expect{ |b| assert(&b) }.to yield_with_no_args
      end

      it 'invokes assert with the block result' do
        assert { 'Evaluates to true' }.should be_nil
      end

      it 'raises error without message' do
        expect{ assert { nil } }.to raise_error(Invariant::AssertionError)
      end
    end

    context 'block invariant with message' do
      it 'invokes block' do
        expect{ |b| assert('The error message', &b) }.to yield_with_no_args
      end

      it 'invokes assert with the block result and message' do
        assert('The error message'){ 'Evaluates to true' }.should be_nil
      end

      it 'raises error with message' do
        expect{ assert('The error message'){ 1 == 2 } }.to raise_error(Invariant::AssertionError, 'The error message')
      end
    end
  end

end
