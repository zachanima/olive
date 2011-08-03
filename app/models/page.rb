class Page < ActiveRecord::Base
  attr_accessible :title, :text

  validates_presence_of :title
  validates :position, presence: true, uniqueness: true, numericality: { greater_than: 0 }

  default_scope order: :position

  before_validation :assign_position

  private
  def assign_position
    if Page.count == 0
      self.position = 1
    else
      self.position = Page.last.position + 1
    end
  end
end
