module Mocha # :nodoc:
  
  class ExceptionRaiser # :nodoc:
    
    def initialize(exception, message, *args)
      @exception, @message, @args = exception, message, args
    end
    
    def evaluate
      raise @exception, @exception.to_s if @exception.is_a?(Module) && @exception.ancestors.include?(Interrupt)
      raise @exception, @message, *@args if @message && !@args.empty?
      raise @exception, @message if @message
      raise @exception
    end
    
  end
  
end
