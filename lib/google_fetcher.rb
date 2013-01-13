#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

class GoogleFetcher

  def initialize(argv)
  	begin
    	patentpage = Nokogiri::HTML(open("http://www.google.com/patents/US#{argv}"))
    rescue OpenURI::HTTPError
    	patentpage = "link broken"
 	end
    outFile = File.new("../data/google/#{argv}.html", "a+")
    outFile.puts(patentpage)
    outFile.close
  end

end

#GoogleFetcher.new(ARGV[0])
