
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

class USPTOScraper

	attr_accessor :count

	def initialize(patent) # default patent
		patentpage = Nokogiri::HTML(open("./data/uspto/#{patent}.html"))
		doc = patentpage.xpath("//body/table")
		rows = doc.xpath("//table//tr[1 <= position() and position() < 200]/td[2]/a/text()")
		# list_citations(rows)
		@count = rows.length
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