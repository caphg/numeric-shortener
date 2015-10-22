class Prettifier
  M = 1000000.0
  B = 1000000000.0
  T = 1000000000000.0
  Q = 1000000000000000.0

  def combine(number, scale, suffix)
    (number / scale).round(1).to_s.chomp('.0')+suffix
  end

  def prettify(number)
    unless number.is_a? Numeric
      raise TypeError, 'Not a numeric type'
    end

    abs_number = number.abs
    if abs_number >= M
      if abs_number < B
        return combine(number, M, 'M')
      elsif abs_number < T
        return combine(number, B, 'B')
      elsif abs_number < Q
        return combine(number, T, 'T')
      else
        raise  ArgumentError, 'Number too big'
      end
    end
    number.to_s
  end
end