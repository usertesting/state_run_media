require File.expand_path(File.dirname(__FILE__) + '/../test_helper')
require 'rubygems'
require 'state_machine'
require 'state_run_media'

class MyMinimalStateMachine
  state_machine :foo, initial: :beginning_state do
    state :another_state
    event :change_something do
      transition :beginning_state => :another_state
    end
  end
end

class FooListener
  attr_reader :call_log

  def initialize
    @call_log = []
  end

  def my_minimal_state_machine_foo_beginning_state_to_another_state(*args)
    @call_log << [:my_minimal_state_machine_foo_beginning_state_to_another_state, args]
  end
end

class RegistrationTest < Test::Unit::TestCase
  def test_basic_transition_publishes
    foo_machine = MyMinimalStateMachine.new
    listener = FooListener.new
    Wisper.with_listeners(listener) do
      foo_machine.change_something!
    end
    assert_equal([[:my_minimal_state_machine_foo_beginning_state_to_another_state, [foo_machine]]], listener.call_log)
  end
end
