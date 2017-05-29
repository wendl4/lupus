class CreateDatasetRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :dataset_records do |t|
      t.references :dataset, foreign_key: true
      t.string :external_identifier
      t.string :external_url
      t.text :data

      t.timestamps
    end
  end
end
