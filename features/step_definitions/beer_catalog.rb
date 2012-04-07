Given /^we have the following beers in our catalog:$/ do |table|
  @beer_catalog = table.raw
  puts @beer_catalog
end

Then /^I should see the following beers on tap:$/ do |table|
  @beers_on_tap = table.raw.flatten!
  
  @beer_catalog.should = @beers_on_tap
end

# [{"type_en"=>beer, "type_zh"=>beer, "description_en"=>"Fake description.", "description_zh"=>"Fake description.", "on_tap"=>on_tap}, ]