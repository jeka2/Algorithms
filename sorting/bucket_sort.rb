class BucketSort
	##Since bucket sort efficiency is entirely dependent on the allocation of
	##the elements in the buckets(in other words, I'm assuming whoever is using it is
	##overall aware of the distribution of the data), I'm going to assume a relatively 
	##even distribution and sort each individual bucket with selection sort
	def sort(arr, size)
		@arr = []
		if arr.empty?
			return 'empty array'
		end
		bucket_allocate(arr, size)
		@arr.flatten
	end

	def bucket_allocate(arr, size, max = arr.max, min = arr.min)
		number_of_buckets = ((max - min) / size).floor + 1
		buckets = Array.new(number_of_buckets)
		0.upto(buckets.length - 1) do |i|
			buckets[i] = []
		end
		0.upto(arr.length - 1) do |i|
			buckets[((arr[i] - min) / size).floor].push(arr[i])
		end 
		individual_bucket_sort(buckets, arr.length)
	end

	def individual_bucket_sort(buckets, size)
		sorted_arr = Array.new(size)
		0.upto(buckets.length - 1) do |i|
			selection_sort(buckets[i])
		end
	end

	def selection_sort(arr)
		0.upto(arr.length - 2) do |i|
			min = i
			(i + 1).upto(arr.length) do |j|
				if arr[j] < arr[min]
					min = j
				end
			end
			temp = arr[i]
			arr[i] = arr[min]
			arr[min] = temp
		end
		@arr << arr
	end

end

