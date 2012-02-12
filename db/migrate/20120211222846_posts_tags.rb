class PostsTags < ActiveRecord::Migration # join table for posts/tags
  create_table :posts_tags, :id => false do |t|
    t.integer :post_id
    t.integer :tag_id
  end
end
