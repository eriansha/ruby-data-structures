module BinarySearch
  extend self

  def find_index(arr, element)
    lower_point = 0
    higher_point = arr.size - 1
    
    while lower_point <= higher_point
      mid_point = (lower_point + higher_point) / 2

      if arr[mid_point] < element
        lower_point = mid_point + 1
      elsif arr[mid_point] > element
        higher_point = mid_point - 1
      else
        return mid_point
      end
    end

    return nil
  end

end
