Given /^I have no ladies$/ do
  Lady.delete_all
end

Given /^I (only )?have ladies titled "?([^\"]*)"?$/ do |only, titles|
  Lady.delete_all if only
  titles.split(', ').each do |title|
    Lady.create(:name => title)
  end
end

Then /^I should have ([0-9]+) lad[y|ies]+?$/ do |count|
  Lady.count.should == count.to_i
end
