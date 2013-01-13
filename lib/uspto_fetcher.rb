#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

class USPTOFetcher

  def initialize(argv)
  	begin 
    	patentpage = Nokogiri::HTML(open("http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-adv.htm&r=0&f=S&l=50&d=PALL&Query=ref/#{argv}"))
    rescue OpenURI::HTTPError
    	patentpage = "link broken"
 	end
    outFile = File.new("./data/uspto/#{argv}.html", "a+")
    outFile.puts(patentpage)
    outFile.close
  end

end

#USPTOFetcher.new(ARGV[0])
