class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|

      t.timestamps
    end
  end
end
