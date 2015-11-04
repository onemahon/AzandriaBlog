class PopulateStartingTags < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        tags = [
          'rails',
          'tips & tricks',
          'music',
          'photography',
          'dev'
        ]

        tags.each {|tag| Tag.new(name: tag).save }
      end
    end
  end
end
