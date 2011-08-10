Factory.define :page do |factory|
  factory.title 'foo'
end

Factory.define :section do |factory|
  factory.text 'foo'
  factory.association :page
end
