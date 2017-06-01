class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :record_id
      t.text :text
      t.string :author

      t.timestamps
    end
  end
end
