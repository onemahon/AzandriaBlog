class Post < ActiveRecord::Base
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :abstract, presence: true
  validates :content, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :post_tags, allow_destroy: true

  scope :for_tag, -> (tag) { joins(:post_tags).merge(PostTag.where(tag: tag)) }
  scope :published, -> { where(published: true) }
  scope :recent, -> { order(created_at: :desc) } # TODO, sometime: pagination

  def self.params
    [
      :abstract,
      :content,
      :published,
      :title
    ]
  end
end
