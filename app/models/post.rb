class Post < ActiveRecord::Base
  def self.params
    [
      :abstract,
      :content,
      :title
    ]
  end
end
