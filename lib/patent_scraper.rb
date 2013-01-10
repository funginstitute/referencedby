#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

=begin
xpath for google patent page http://www.google.com/patents/US5136185
//*[@id="patent_referenced_by_v"]/table/tbody/tr[2]
=end

class PatentScraper

  @patentpage

  def initialize(patent = "5678913")
    # URL for search on patent number defined above
    #patentquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2FPTO%2Fsearch-bool.html&r=1&f=G&l=50&co1=AND&d=PTXT&s1=#{patent}.PN.&OS=PN/#{patent}&RS=PN/#{patent}"
    @patentpage = Nokogiri::HTML(open("http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-adv.htm&r=0&f=S&l=50&d=PALL&Query=ref/#{patent}"))
  end

  def patentpage
    @patentpage
  end

end
