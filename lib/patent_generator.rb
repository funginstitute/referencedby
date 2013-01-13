#!/usr/bin/env ruby

# must be Ruby version 1.9 +

# Lowest patent number available is 03858241

# method that returns n random numbers between [from, to]

require_relative 'google_fetcher'
require_relative 'uspto_fetcher'
require_relative 'google_scraper'
require_relative 'uspto_scraper'

class PatentGenerator
	@patentlist
	def initialize(arg, from = 4000000, to = 8000000)
		to = to + 1 # ensures that the range include 'to'
		@patentlist = arg.times.map{ from + Random.rand(to - from) }
		@patentlist.each do |patent|
			GoogleFetcher.new(patent)
			GoogleScraper.new(patent)
			USPTOFetcher.new(patent)
			USPTOScraper.new(patent)
		end
	end

	def patentlist
		@patentlist
	end	
end

PatentGenerator.new(Integer(ARGV[0]))
