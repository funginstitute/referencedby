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
		csv_data = {}
		count = 0
		File.open("./cleantechcounts1_unix.csv", "r").each_line do |line|
			line = line.strip.split(' ')
			csv_data[count] = line
			#puts csv_data[count]
			count = count + 1
		end

		@patentlist = arg.times.map{ csv_data[Random.rand(csv_data.length)] }
		@patentlist.each do |patent, filecount|
			GoogleFetcher.new(patent)
			googlecount = GoogleScraper.new(patent).output_count
			USPTOFetcher.new(patent)
			usptocount = USPTOScraper.new(patent).output_count
			outFile = File.open("./reports/reports_all.csv", "a+")
			outFile.print("\n0#{patent}, #{filecount}, #{usptocount}, #{googlecount}")
			outFile.close
		end
	end 

	def patentlist
		@patentlist
	end	
end

PatentGenerator.new(Integer(ARGV[0]))
