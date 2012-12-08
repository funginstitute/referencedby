#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

list_of_presidents = Nokogiri::HTML.parse(open('http://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States'))

patent = "5136185"
patentquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2FPTO%2Fsearch-bool.html&r=1&f=G&l=50&co1=AND&d=PTXT&s1=#{patent}.PN.&OS=PN/#{patent}&RS=PN/#{patent}"

refquery = "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-adv.htm&r=0&f=S&l=50&d=PALL&Query=ref/#{patent}"

patentpage = Nokogiri::HTML(open(refquery))

puts patentpage

puts "============================================================================="

#doc = patentpage.xpath("//table/tr[2]/td[1]")
doc = patentpage.at_css("table")

puts doc

puts "============================================================================="

for el in doc.css('html').children
  puts el.name
    for el2 in el.children
      puts "--" + el2.name + " " + el2.attributes.to_json
    end
end
puts "============================================================================="

=begin
  an_array_of_links = list_of_presidents.xpath("//tr/td[3]/a[1]")

  ## These two variables will be added to throughout the execution of the script
  ## At the end, they'll have the answers

  prez_count = 0
  total_age = 0

  an_array_of_links.each do |link_to_test|  

     last_name = link_to_test.content.split(' ')[-1]   

    if last_name.length > 6
      the_link_to_the_presidents_page = link_to_test["href"]
      the_link_to_the_presidents_page = "http://en.wikipedia.org" + the_link_to_the_presidents_page
      prez_page = Nokogiri::HTML(open(the_link_to_the_presidents_page))

      puts "Entering the page: #{the_link_to_the_presidents_page}"

      death_date = prez_page.xpath("//th[contains(text(), 'Died')]/following-sibling::*")

      if death_date && death_date[0]

        # Doing something like `if some_variable_name` is
        # basically asking, "Does some_variable_name have any value?".
        # It will return false if some_variable_name has been set to
        # false or if it had never been set to anything at all, not
        # even 0 or an empty string (both of which would return true)
        # The double ampersand && functions as an "AND", requiring
        # that two conditional tests be true before entering the
        # if-statement's true branch

        age_at_death = death_date[0].content.match(/aged.+?([0-9]+)/)[1]
          if age_at_death
            # we only get here if there was a "Died" table cell AND a text
            # pattern similar to: "aged XX"
            puts "Age of #{link_to_test.content} is: #{age_at_death}"
            # technically, age_at_death[0] is a String. to_i will make
            # it a Number so we can safely add it to total_age
            total_age += age_at_death[1].to_i
            prez_count += 1
          end #end of the if age_at_death
      end # end of the if death_date...
    else
      # we reach this branch of code if last_name was shorter than 6.
      # Let's print a debug message to notify us:
      puts "#{last_name} is not longer than 6 letters"
    end #end of the if last_name.length > 6

  end # OK, we're at the end of the each loop. Go back to the top

  # if we got here, we're out of the loop, and total_age
  # and prez_count have the right values. So:
  # to_f converts an integer to a decimal number,
  # so we'll get partial years for the average
  the_final_value = total_age/prez_count.to_f
  puts "#{prez_count} presidents were counted, their age totaling: #{total_age}."
  puts "The average of their ages is #{the_final_value}"
=end
