class Page < ActiveRecord::Base
  attr_accessible :title, :text

  has_many :sections, dependent: :destroy

  validates_presence_of :title
  validates :position, presence: true, uniqueness: true, numericality: { greater_than: 0 }

  default_scope order: :position

  before_validation :set_initial_position

  def to_param
    "#{self.id}-#{self.title.parameterize if self.title}"
  end

  private
  def set_initial_position
    if self.position == nil
      if Page.count == 0
        self.position = 1
      else
        self.position = Page.last.position + 1
      end
    end
  end
end
