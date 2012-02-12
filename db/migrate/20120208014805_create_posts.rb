class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.date :pub_date
      t.integer :status

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
