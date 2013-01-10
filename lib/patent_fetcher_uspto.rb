#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

# this class is to fetch a patent from either Google or USPTO
class PatentFetcher
  
  @patentpage

  def initialize(argv)
    # URL for search on patent number defined above
    #patentquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2FPTO%2Fsearch-bool.html&r=1&f=G&l=50&co1=AND&d=PTXT&s1=#{patent}.PN.&OS=PN/#{patent}&RS=PN/#{patent}"
	puts "Fetching patent #{argv}"
    @patentpage = Nokogiri::HTML(open("http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-adv.htm&r=0&f=S&l=50&d=PALL&Query=ref/#{argv}"))
    outFile = File.new("../data/uspto/#{argv}.html", "a+")
    outFile.puts(@patentpage)
    outFile.close
  end

  def patentpage
    @patentpage
  end

fetchedpatent = PatentFetcher.new(ARGV[0])

end
