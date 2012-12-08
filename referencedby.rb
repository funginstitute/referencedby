#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'


patent = "5136185"
#patentquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2FPTO%2Fsearch-bool.html&r=1&f=G&l=50&co1=AND&d=PTXT&s1=#{patent}.PN.&OS=PN/#{patent}&RS=PN/#{patent}"
refquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-adv.htm&r=0&f=S&l=50&d=PALL&Query=ref/#{patent}"

patentpage = Nokogiri::HTML(open(refquery))


#doc = patentpage.xpath("//table//tr[2]//td[1]")
#doc = patentpage.xpath("//table//tr")
doc = patentpage.xpath("//body/table")

#rows = doc.xpath("//table//tr[2]/td[2]")
rows = doc.xpath("//table//tr[1 <= position() and position() < 200]/td[2]/a/text()")
puts rows
puts "============================================================================="

#doc = patentpage.xpath("/x:html/x:body/x:table/x:tbody/x:tr[2]/x:td[4]/x:a")
#doc = patentpage.xpath("//html//body//table//tbody//tr[2]//td[2]//text()")
#doc = patentpage.xpath("//table//tbody//tr[2]//td[2]//text()")
#doc = patentpage.xpath("//table//tbody//tr")


