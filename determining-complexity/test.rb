class Test
 ## I chose to use merge sort
 	def improved_time_complexity(*arrays)
   		 combined_array = arrays.flatten
 	end

 	def sort(array)
 		n = array.length
 		return if n == 1
 		mid = n / 2
 		left = Array.new(mid)
 		right = Array.new(n - mid)
 		0.upto(left.length - 1) do |i|
 			left[i] = array[i]
 		end
 		0.upto(right.length - 1) do |i|
 			right[i] = array[i + mid]
 		end
 		sort(left)
 		sort(right)
 		merge(array, left, right)
 		array
 	end

    def merge(array, left, right)
    	i = 0
    	j = 0
    	k = 0
    	left_elements = left.length
    	right_elements = right.length
    	while i < left_elements && j < right_elements
    		if left[i] <= right[j]
    			array[k] = left[i]
    			i += 1
    		else
    			array[k] = right[j]
    			j += 1
    		end
    		k += 1
    	end
    	while i < left_elements
    		array[k] = left[i]
    		i += 1
    		k += 1
    	end
    	while j < right_elements
    		array[k] = right[j]
    		j += 1
    		k += 1
		end
	end
   
end
 