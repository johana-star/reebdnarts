Given /^we have the following beers in our catalog:$/ do |table|
  @beer_catalog = table.raw
end

Then /^I should see the following beers on tap:$/ do |table|
  @beers_on_tap = table.raw.flatten!
  
  @beer_catalog.should = @beers_on_tap
end
