# PRETTIFIER class has method prettify
# which takes numeric input parameter
# and outputs the short scale string
# version of it
#
# Author:: Hrvoje Grdic
# License:: Distributes under the same terms as Ruby

class Prettifier
  MILLION = 1000000.0
  BILLION = 1000000000.0
  TRILLION = 1000000000000.0
  QUADRILLION = 1000000000000000.0

  # Takes number as input and returns string
  def prettify(number)
    # Raise exception for invalid parameter
    unless number.is_a? Numeric
      raise TypeError, 'Not a numeric type'
    end

    # Handle negative input
    abs_number = number.abs
    if abs_number >= MILLION
      if abs_number < BILLION
        return combine(number, MILLION, 'M')
      elsif abs_number < TRILLION
        return combine(number, BILLION, 'B')
      elsif abs_number < QUADRILLION
        return combine(number, TRILLION, 'T')
      else
        raise  ArgumentError, 'Number too big'
      end
    end
    # Return original value
    number.to_s
  end

  private

  # Helper method
  def combine(number, scale, suffix)
    (number / scale).round(1).to_s.chomp('.0')+suffix
  end
end