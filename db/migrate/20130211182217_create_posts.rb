class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :poster_id
      t.integer :recipient_id
      t.text :text

      t.timestamps
    end
  end
end
