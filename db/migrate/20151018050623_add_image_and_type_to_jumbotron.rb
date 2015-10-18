class AddImageAndTypeToJumbotron < ActiveRecord::Migration
  def change
    add_column :jumbotrons, :image, :string
    add_column :jumbotrons, :image_description, :string
    add_column :jumbotrons, :time_period_type, :string
  end
end
