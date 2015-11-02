class AddQuoteToJumbotron < ActiveRecord::Migration
  def change
    add_column :jumbotrons, :quote, :string
  end
end
