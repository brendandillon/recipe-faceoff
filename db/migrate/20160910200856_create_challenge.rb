class CreateChallenge < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :theme
      t.date :end_date
      t.references :user, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
