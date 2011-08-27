Factory.define :page do |factory|
  factory.title 'foo'
end

Factory.define :section do |factory|
  factory.text 'foo'
  factory.association :page
end

Factory.define :link do |factory|
  factory.title 'foo'
  factory.location 'http://example.com'
end
