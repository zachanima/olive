class Section < ActiveRecord::Base
  attr_accessible :title, :text

  belongs_to :page, dependent: :destroy

  validates_presence_of :page
  validates_presence_of :text
end
