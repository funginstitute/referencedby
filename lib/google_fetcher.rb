#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

class GoogleFetcher

  def initialize(argv)
    patentpage = Nokogiri::HTML(open("http://www.google.com/patents/US#{argv}"))
    outFile = File.new("../data/google/#{argv}.html", "a+")
    outFile.puts(patentpage)
    outFile.close
  end

end

PatentFetcher.new(ARGV[0])
