class AddQuoteLinkToJumbotrons < ActiveRecord::Migration
  def change
    add_column :jumbotrons, :quote_text_author, :string
    add_column :jumbotrons, :quote_text_full, :text
    add_column :jumbotrons, :quote_text_title, :string
  end
end
