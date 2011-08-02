class Page < ActiveRecord::Base
  attr_accessible :title, :text
  validates_presence_of :title
end
