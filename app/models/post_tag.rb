class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag

  def self.params
    [
      :id,
      :post_id,
      :tag_id
    ]
  end
end
