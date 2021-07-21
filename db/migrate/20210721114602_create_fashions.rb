class CreateFashions < ActiveRecord::Migration[5.2]
  def change
    create_table :fashions do |t|
      t.string :title, null: false
      t.string :body
      t.string :shop
      t.string :pic
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
