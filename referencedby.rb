#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

=begin
xpath for google patent page http://www.google.com/patents/US5136185
//*[@id="patent_referenced_by_v"]/table/tbody/tr[2]
=end

class ReffedBy

  def initialize(patent)
    # URL for search on patent number defined above
    #patentquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2FPTO%2Fsearch-bool.html&r=1&f=G&l=50&co1=AND&d=PTXT&s1=#{patent}.PN.&OS=PN/#{patent}&RS=PN/#{patent}"
    refquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-adv.htm&r=0&f=S&l=50&d=PALL&Query=ref/#{patent}"

    patentpage = Nokogiri::HTML(open("./data/uspto/#{patent}.html"))

    doc = patentpage.xpath("//body/table")
    rows = doc.xpath("//table//tr[1 <= position() and position() < 200]/td[2]/a/text()")
    puts rows.length
    rows.each do |r|
      puts "0" + r.to_s.gsub(/,/,'')
    end
  end

end

#patent = "5136185"
patent = "5539337"
refby = ReffedBy.new(patent)

describe ReffedBy do
  it "works"
end
