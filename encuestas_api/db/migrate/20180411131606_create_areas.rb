class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :result
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
