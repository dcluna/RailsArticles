class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.date :pub_date
      t.string :status
      t.boolean :published

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
