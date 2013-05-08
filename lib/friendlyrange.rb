class FriendlyRange
  include Enumerable

  def initialize(ranges_string)
    @ranges_string = ranges_string
    @ranges_array  = parse(@ranges_string)
  end

  def each(&block)
    @ranges_array.each(&block)
  end

  def ==(other)
    @ranges_array == other
  end

  def to_s
    array_to_string_of_ranges(@ranges_array)
  end

  private

  def parse(ranges_string)
    tmp_array = []

    ranges_string.split(/\s*,\s*/).each do |item|
      if item =~ /(\d+)\s*-\s*(\d+)/
        first, last = $1.to_i, $2.to_i
        first, last = last, first if first > last
        first.upto(last) { |rangeitem| tmp_array << rangeitem }
      elsif item =~ /^\s*(\d+)\s*$/
        tmp_array << item.to_i
      else
        raise ArgumentError, "Cannot parse '#{ranges_string}'"
      end
    end

    tmp_array.sort.uniq
  end

  def array_to_string_of_ranges(ranges_array)
    range_strings = []
    range_start = range_end = ranges_array.sort[0]

    ranges_array.drop(1).sort.each do |n|
      if n == range_end + 1
        # Number is sequential, extend the range
        range_end = n
      else
        # Number is non-sequential, add the range
        range_strings << range_string(range_start, range_end)
        range_start = range_end = n
      end
    end

    # Add the final range we found
    range_strings << range_string(range_start, range_end)

    range_strings.join(', ')
  end

  def range_string(range_start, range_end)
    if range_start == range_end
      range_start.to_s
    else
      "#{range_start}-#{range_end}"
    end
  end
end
