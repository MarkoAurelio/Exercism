class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if first_operand.is_a?(String) || second_operand.is_a?(String)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation

    begin
    "#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation,second_operand)}"
    rescue ZeroDivisionError => e
      "Division by zero is not allowed."
    end
  end
end

