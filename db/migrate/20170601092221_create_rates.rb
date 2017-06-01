class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :record_id
      t.integer :dataset_id
      t.integer :rate_value

      t.timestamps
    end
  end
end
