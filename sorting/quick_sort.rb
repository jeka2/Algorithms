class QuickSort
	
	def partition(array, start, finish)
		pivot = array[finish]
		index = start
		start.upto(finish - 1) do |i|
			if array[i] <= pivot
				temp = array[index]
				array[index] = array[i]
				array[i] = temp
				index += 1
			end
		end
		temp = array[finish]
		array[finish] = array[index]
		array[index] = temp
		return index
	end

	def sort(array, start = 0, finish = array.length - 1)
		return array if start >= finish
		index = partition(array, start, finish)
		sort(array, start, index - 1)
		sort(array, index + 1, finish)
	end

end