class Page < ActiveRecord::Base
  attr_accessible :title, :text
  validates_presence_of :title
  default_scope order: :position
end
