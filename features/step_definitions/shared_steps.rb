Then /^I should have (\d+) (.*) records?$/ do |count, model_name|
  to_ar_model(model_name).count.should == count.to_i
end

Given /^the following (.+) record$/ do |model_name, table|
  factory = to_factory_name(model_name)
  map_association_columns!(table, factory)
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

