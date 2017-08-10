class CreateDatasets < ActiveRecord::Migration[5.0]
  def change
    create_table :datasets do |t|
      t.string :name
      t.integer :user_id
      t.integer :rating
      t.integer :rating_count
      t.timestamps
    end
  end
end
