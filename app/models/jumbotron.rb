class Jumbotron < ActiveRecord::Base
  mount_uploader :image, JumbotronUploader

  module TIME_PERIOD_TYPES
    DAY = 'day'
    DUSK = 'dusk'
    NIGHT = 'night'

    # If there are no available images for current time of day,
    # the Jumbotron will pick the latest "default" object.
    DEFAULT = 'default'

    ALL = [DAY, DUSK, NIGHT, DEFAULT]
  end

  validates :image, presence: true
  validates :time_period_type, inclusion: { in: TIME_PERIOD_TYPES::ALL }
  validates :title, presence: true

  def self.params
    [
      :title,
      :subtitle,
      :image,
      :image_description,
      :time_period_type
    ]
  end

  def self.random_for_current_time
    time_period = case Time.now.hour
      when 7..17
        'day'
      when 17..21
        'dusk'
      else
        'night'
    end

    where(time_period_type: time_period).order('RANDOM()').limit(1).first
  end
end
