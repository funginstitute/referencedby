
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

class GoogleScraper

	attr_accessor :count

	def initialize(patent) # default patent
		patentpage = Nokogiri::HTML(open("./data/google/#{patent}.html"))
		rows= patentpage.xpath("//*[@id='patent_referenced_by_v']/table/\
			tr[1 < position() and position() < 200]/td[1]/a/text()")
		# list_citations(rows)
		@count = rows.length
		puts @count
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