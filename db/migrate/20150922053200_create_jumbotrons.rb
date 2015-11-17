class CreateJumbotrons < ActiveRecord::Migration
  def change
    create_table :jumbotrons do |t|
      t.string :title
      t.string :subtitle

      t.timestamps
    end
  end
end
