class CreateUploadedImages < ActiveRecord::Migration
  def change
    create_table :uploaded_images do |t|
      t.string :alt_text
      t.string :image
      t.string :tags

      t.timestamps
    end
  end
end
