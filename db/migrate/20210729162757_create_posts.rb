class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.references :topic

      t.timestamps
    end
  end
end
