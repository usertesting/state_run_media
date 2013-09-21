require 'state_machine/machine'

StateMachine::Machine.class_eval do
  def after_initialize
    self.before_transition StateRunMedia::StateMachineObserver.method(:before_transition)
  end
end
