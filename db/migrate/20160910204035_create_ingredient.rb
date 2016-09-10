class CreateIngredient < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.references :challenge, foreign_key: true
      t.integer :unit_cost

      t.timestamps null: false
    end
  end
end
