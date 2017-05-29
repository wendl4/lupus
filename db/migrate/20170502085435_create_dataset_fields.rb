class CreateDatasetFields < ActiveRecord::Migration[5.0]
  def change
    create_table :dataset_fields do |t|
      t.references :dataset, foreign_key: true
      t.string :field_name
      t.string :title
      t.string :field_type

      t.timestamps
    end
  end
end
