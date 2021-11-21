# Efficiency worst case is quadratic time complexity
module BubbleSort
  extend self

  def sort(input_array)
    unordered_until_index = input_array.size - 1

    while unordered_until_index >= 0 do
      i = 0

      while i < unordered_until_index do
        if (input_array[i] > input_array[i + 1])
          input_array[i], input_array[i + 1] = input_array[i + 1], input_array[i]
        end

        i += 1
      end

      unordered_until_index -= 1
    end

    return input_array
  end

end
