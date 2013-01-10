#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

=begin
xpath for google patent page http://www.google.com/patents/US5136185
//*[@id="patent_referenced_by_v"]/table/tbody/tr[2]
=end

# this scrapes a fetched page.
class PatentScraper
	@rows # holds a list of patent numbers
	def initialize(patent="5678913") # default patent
		fetchedpatent = PatentFetcher.new(patent)
		doc = (fetchedpatent.patentpage).xpath("//body/table")

		@rows = doc.xpath("//table//tr[1 <= position() and position() < 200]/td[2]/a/text()")
		
		puts "scraped patents:"
		@rows.each do |r|
		  puts "0" + r.to_s.gsub(/,/,'')
		end
	end
	
	def rows
		@rows
	end
end
