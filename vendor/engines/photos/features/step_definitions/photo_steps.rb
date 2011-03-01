Given /^I have no photos$/ do
  Photo.delete_all
end

Given /^I (only )?have photos titled "?([^\"]*)"?$/ do |only, titles|
  Photo.delete_all if only
  titles.split(', ').each do |title|
    Photo.create(:caption => title)
  end
end

Then /^I should have ([0-9]+) photos?$/ do |count|
  Photo.count.should == count.to_i
end
