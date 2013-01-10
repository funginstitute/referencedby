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
    #patentquery = "http://www.google.com/patents/US#{argv}"
	puts "Fetching patent #{argv}"
    @patentpage = Nokogiri::HTML(open("http://www.google.com/patents/US#{argv}"))
    outFile = File.new("../data/google/#{argv}.html", "a+")
    outFile.puts(@patentpage)
    outFile.close
  end

  def patentpage
    @patentpage
  end

end

PatentFetcher.new(ARGV[0])