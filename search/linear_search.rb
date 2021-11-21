module LinearSearch
  extend self

  def find_index(arr, element)
    arr.each_with_index do |value, index|
      return index if value == element
    end

    return nil
  end

end
