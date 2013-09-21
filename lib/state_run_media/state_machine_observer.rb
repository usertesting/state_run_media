module StateRunMedia
  class StateMachineObserver
    class << self
      include Wisper::Publisher

      def underscore(string)
        word = string.dup
        #word.gsub!(/::/, '_')
        word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
        #word.tr!("-", "_")
        word.downcase!
        word
      end

      def before_transition(object, transition)
        name = [underscore(object.class.name), transition.attribute, transition.from_name, 'to', transition.to_name].join('_')
        publish(name.to_sym, object)
      end
    end
  end
end
