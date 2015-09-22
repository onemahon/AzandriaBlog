class CreateJumbotrons < ActiveRecord::Migration
  def change
    create_table :jumbotrons do |t|
      t.string :title
      t.string :subtitle

      t.timestamps
    end

    reversible do |direction|
      direction.up do
        Jumbotron.new(title: 'This Is My Blog', subtitle: 'Cool things, written by me').save
      end
    end
  end
end
