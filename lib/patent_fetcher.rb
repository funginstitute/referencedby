#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

# this class is to fetch a patent from either Google or USPTO
class PatentFetcher

  @patentpage

  def initialize(patent)
    # URL for search on patent number defined above
    #patentquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2FPTO%2Fsearch-bool.html&r=1&f=G&l=50&co1=AND&d=PTXT&s1=#{patent}.PN.&OS=PN/#{patent}&RS=PN/#{patent}"
	puts "Fetching patent #{patent}"
    @patentpage = Nokogiri::HTML(open("/#{patent}"))
    outFile = File.new("../data/uspto/#{patent}.html", "a+")
    outFile.puts(@patentpage)
    outFile.close
  end

  def patentpage
    @patentpage
  end

  
end
