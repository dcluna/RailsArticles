class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :tag_id # foreign key to Tag
      t.integer :post_id # foreign key to Post
      t.timestamps
    end
  end
end
