
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

class GoogleScraper

	attr_accessor :count

	def initialize(patent) # default patent
		patentpage = Nokogiri::HTML(open("../data/google/#{patent}.html"))
		rows= patentpage.xpath("//*[@id='patent_referenced_by_v']/table/\
			tr[1 < position() and position() < 200]/td[1]/a/text()")
		# list_citations(rows)
		outFile = File.new("../reports/google/#{patent}.txt", "a+")
		@count = rows.length
		outFile.puts("patent #{patent} referenced by count: ")
		outFile.puts(@count)
		outFile.close
	end

  	def list_citations(rows)
  	  	rows.each do |r|
		  puts "0" + r.to_s.gsub(/,/,'')
		end
	end

	def output_count
		print @count, "\n"
	end

end