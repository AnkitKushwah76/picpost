class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :caption
      t.binary :image
      t.integer :user_id
      t.timestamps
    end
  end
end
