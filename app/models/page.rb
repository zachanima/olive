class Page < ActiveRecord::Base
  attr_accessible :title, :text, :image, :page_id

  belongs_to :page
  has_many :pages
  has_many :sections, dependent: :destroy

  validates_presence_of :title
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope order: :position

  before_validation :set_initial_position

  has_attached_file :image, styles: { thumb: '100x100#', small: '240x240>' }

  def to_param
    "#{self.id}-#{self.title.parameterize if self.title}"
  end
end
