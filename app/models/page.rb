class Page < ActiveRecord::Base
  attr_accessible :title, :text

  validates_presence_of :title
  validates :position, presence: true, uniqueness: true, numericality: { greater_than: 0 }

  default_scope order: :position

  before_validation :set_position

  private
  def set_position
    if self.new_record?
      if Page.count == 0
        self.position = 1
      else
        self.position = Page.last.position + 1
      end
    end
  end
end
