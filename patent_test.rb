#!/usr/bin/env ruby

# This code tests all three functions: patent_generator, patent_fetcher, and patent_scraper
# Note that there is internal call to patent_fetcher within patent_scraper.
load 'lib/patent_generator.rb'
load 'lib/patent_fetcher.rb'
load 'lib/patent_scraper.rb'

patents = PatentGenerator.new.patentlist
patents.each do |p|
	PatentScraper.new(p)
end
