class PostsTags < ActiveRecord::Migration # join table for posts/tags
  def up
    create_table :posts_tags, :id => false do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end
    add_index :posts_tags, [:post_id, :tag_id], :unique => true
    add_foreign_key :posts_tags, :posts
    add_foreign_key :posts_tags, :tags
  end

  def down
    remove_foreign_key :posts_tags, :posts
    remove_foreign_key :posts_tags, :tags
    remove_index :posts_tags, :column => [:post_id, :tag_id]
    drop_table :posts_tags
  end
end
