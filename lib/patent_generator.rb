#!/usr/bin/env ruby

require_relative 'google_fetcher'
require_relative 'uspto_fetcher'
require_relative 'google_scraper'
require_relative 'uspto_scraper'

class PatentGenerator

	def initialize(arg)
		csv_data = {}
		count = 0
		File.open("./cleantechcounts1_unix.csv", "r").each_line do |line|
			line = line.strip.split(' ')
			csv_data[count] = line
			count = count + 1
		end
		patentlist = arg.times.map{ csv_data[Random.rand(csv_data.length)] }
		patentlist.each do |patent, filecount|
			GoogleFetcher.new(patent)
			googlecount = GoogleScraper.new(patent).count
			USPTOFetcher.new(patent)
			usptocount = USPTOScraper.new(patent).count
			outFile = File.open("./reports/reports_all.csv", "a+")
			outFile.print("\n0#{patent}, #{filecount}, #{usptocount}, #{googlecount}")
			outFile.close
		end
	end
end

PatentGenerator.new(Integer(ARGV[0]))
