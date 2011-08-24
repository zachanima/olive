class Section < ActiveRecord::Base
  attr_accessible :title, :text

  belongs_to :page

  validates_presence_of :page, :text
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope order: :position

  before_validation :set_initial_position

  private
  def set_initial_position
    if self.position == nil
      if self.page and self.page.sections.count == 0
        self.position = 0
      elsif self.page
        self.position = self.page.sections.last.position + 1
      end
    end
  end
end
