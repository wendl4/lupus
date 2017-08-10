class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.string :user_id
      t.text :text
      t.integer :record_id

      t.timestamps
    end
  end
end
