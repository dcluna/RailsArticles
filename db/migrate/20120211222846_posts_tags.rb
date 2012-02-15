class PostsTags < ActiveRecord::Migration # join table for posts/tags
  create_table :posts_tags, :id => false do |t|
    t.belongs_to :post_id
    t.belongs_to :tag_id

    validates :post_id, :uniqueness => { :scope => :tag_id }
  end
end
