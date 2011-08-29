class Section < ActiveRecord::Base
  attr_accessible :title, :text

  belongs_to :page

  validates_presence_of :page, :text
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope order: :position

  before_validation :set_initial_position
end
