module InsertionSort
  extend self

  def sort(arr)
    size = arr.size - 1
    
    # mark first element as sorted
    # then, we start from the 1-index element
    for i in 1..size
      # extract the element
      hold_value = arr[i]
      hold_position = i - 1
      
      while hold_position >= 0
        # if the element is less than latest sorted element
        # move sorted element to the right by 1
        if arr[hold_position] > hold_value
          arr[hold_position + 1] = arr[hold_position]
          # decrease the hold position to continue to the next iteration
          hold_position -= 1
        else
          break
        end
      end

      # since we had decreased the hold position inside the loop
      # we need to add 1 to set the hold value into right position
      arr[hold_position + 1] = hold_value
    end

    return arr
  end

end
