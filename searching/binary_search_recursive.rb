class Binary
  def recursive(collection, value, low = 0, high = collection.length - 1)

    mid = (low + high) / 2

    while low <= high
      if collection[mid] == value
        return mid
      elsif collection[mid] < value
        return recursive(collection, value, mid + 1, high)
      else
        return recursive(collection, value, low, high - 1)
      end
    end
    return 'not found'
  end
end
