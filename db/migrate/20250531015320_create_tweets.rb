class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :text
      t.text :image
      t.timestamps
    end
  end
end