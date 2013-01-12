require 'spec_helper'

describe USPTOScraper do
  it "scrapes a uspto citation count" do
    usp = USPTOScraper.new(5900754)
    usp.count.should == 9
  end
end

describe USPTOScraper do
  it "scrapes a uspto citation count" do
    usp = USPTOScraper.new(5539337)
    usp.count.should == 23
  end
end