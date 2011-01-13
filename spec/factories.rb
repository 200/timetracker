Factory.sequence :name do |n|
  "name_#{n}"
end

Factory.define :task do |record|
  record.name Factory.next(:name)
end
