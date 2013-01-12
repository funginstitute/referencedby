require 'spec_helper'

describe USPTOScraper do
  it "scrapes a uspto citation count" do
    usp = USPTOScraper.new(5900754)
    usp.count.should == 9
  end
end
