#!/usr/bin/env ruby

# must be Ruby version 1.9 +

# method that returns n random numbers between [from, to]
class PatentGenerator
	@patentlist
	def initialize(n=5,from=4000000, to=8000000) # by default, n = 5, from = 4000000, to = 8000000
		to = to+1 # ensures that the range include 'to'
		@patentlist = n.times.map{ from +Random.rand(to-from) }
	end

	def patentlist
		@patentlist
	end	
end
