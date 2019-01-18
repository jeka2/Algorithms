class City
	attr_reader :x
	attr_reader :y
	attr_reader :name

	def initialize(name, x, y)
		@name = name
		@x = x
		@y = y
	end

end

class Path
	def initialize(locations_array = [])
		@path = []
		@locations_array = locations_array
	end

	def nearest_possible_neighbor_route(current_city, locations = nil)
		if !locations
			locations = @locations_array - [current_city]
			@path << current_city
			@starting_city = current_city
		end
		nearest_neighbor = locations[0]
		nearest_neighbor_distance = distance_finder(nearest_neighbor.x, current_city.x, nearest_neighbor.y, current_city.y)

		locations.each_with_index do |loc, index|
			distance_between_points = distance_finder(loc.x, current_city.x, loc.y, current_city.y)
			if distance_between_points <= nearest_neighbor_distance
				nearest_neighbor = loc
				nearest_neighbor_distance = distance_between_points
			end
		end
		@path << nearest_neighbor
		locations = locations - [nearest_neighbor]
		return print_path if locations.empty?
		nearest_possible_neighbor_route(nearest_neighbor, locations)
	end

	def distance_finder(x2, x1, y2, y1)
		return Math.sqrt(((x2-x1) ** 2) + ((y2-y1) ** 2))
	end

	def print_path
		p "Given the nearest neighbor heuritic, the path would be: "
		@path.each { |point| puts "#{point.name}, then "}
		p "And to close the off, it will go back to #{@starting_city.name}"
	end
end


c1 = City.new("c1", 0, 0)
c2 = City.new("c2", 4, 2)
c3 = City.new("c3", 1, 3)
c4 = City.new("c4", 5, 5)
c5 = City.new("c5", -1, 4)
c6 = City.new("c6", -2, 8)
c7 = City.new("c7", -3, -3)
c8 = City.new("c8", -4, -4)
c9 = City.new("c9", 1, 1)
c10 = City.new("c10", 9, 9)

path = Path.new([c1,c2,c3,c4,c5,c6,c7,c8,c9,c10])
path.nearest_possible_neighbor_route(c1)