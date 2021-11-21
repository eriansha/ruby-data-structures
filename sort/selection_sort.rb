# worst case: quadratic time complextiy
module SelectionSort  
  extend self

  def sort(arr)
    for i in 0...arr.size do
      # set the first unsorted element as the minimum
      min_value = arr[i]
      min_index = i

      # repeat the unsortoed elements
      for j in (i + 1)...arr.size do
        # set the element as new minimum value 
        # if it's less than current minimum value
        if arr[j] < min_value
          min_value = arr[j]
          min_index = j
        end
      end

      # swap the minimum with the first unsorted position
      arr[i], arr[min_index] = arr[min_index], arr[i]
    end

    return arr
  end

end
