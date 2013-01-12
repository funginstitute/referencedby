require 'spec_helper'

describe GoogleScraper do
  it "scrapes a google citation count" do
    usp = GoogleScraper.new(7198223)
    usp.count.should == 26
  end
end

describe GoogleScraper do
  it "scrapes a google citation count" do
    usp = GoogleScraper.new(7000019)
    usp.count.should == 45
  end
end