class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :store, null: false, foreign_key: true
      t.references :category, null: false, default: 1, foreign_key: true

      t.timestamps
    end
  end
end
