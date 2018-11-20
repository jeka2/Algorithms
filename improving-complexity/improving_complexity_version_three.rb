class VersionThree
  def improved_space_complexity(*arrays)
    return arrays if arrays.length == 0
    combined_array = arrays.flatten
  end

  def sort(array)
    0.upto((array.length - 2)) do |i|
      (i + 1).upto(array.length - 1) do |j|
        if array[i] > array[j]
          temp = array[i]
          array[i] = array[j]
          array[j] = temp
          break
        end
      end
    end
    array
  end
end
