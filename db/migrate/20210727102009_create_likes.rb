class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :fashion, foreign_key: true

      t.index [:user_id, :fashion_id], unique: true
      t.timestamps
    end
  end
end
