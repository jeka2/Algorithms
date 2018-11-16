class HeapSort

	def sort(arr)
		build_max_heap(arr)

		(arr.length - 1).downto(0) do |i|
			swap(arr, 0, i)
			heapify(arr, 0, i)
		end
		arr
	end

	def build_max_heap(arr)
		(arr.length / 2 - 1).downto(0) do |i|
			heapify(arr, i, arr.length)
		end
	end

	def heapify(arr, i, n)
		parent = i
		left_child = i * 2 + 1
		right_child = i * 2 + 2
		if left_child < n && arr[left_child] > arr[parent]
			parent = left_child
		end
		if right_child < n && arr[right_child] > arr[parent]
			parent = right_child
		end
		if parent != i 
			swap(arr, parent, i)
			heapify(arr, parent, n)
		end
	end

	def swap(arr, a, b)
		temp = arr[a]
		arr[a] = arr[b]
		arr[b] = temp
	end


end


## [10,52,4,9,20,44,11,3,8,12]