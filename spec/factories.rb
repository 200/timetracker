Factory.sequence :name do |n|
  "name_#{n}"
end

Factory.define :task do |record|
  record.name Factory.next(:name)
  record.time { rand(100) }
end

Factory.define :report do |record|
  record.time { rand(100)}
  record.association :task
end
