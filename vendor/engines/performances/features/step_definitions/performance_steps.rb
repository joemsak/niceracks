Given /^I have no performances$/ do
  Performance.delete_all
end

Given /^I (only )?have performances titled "?([^\"]*)"?$/ do |only, titles|
  Performance.delete_all if only
  titles.split(', ').each do |title|
    Performance.create(:venue_name => title)
  end
end

Then /^I should have ([0-9]+) performances?$/ do |count|
  Performance.count.should == count.to_i
end
