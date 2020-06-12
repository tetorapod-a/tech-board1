class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.references :plan, foreign_key: true
      t.string :image
      t.timestamps
    end
  end
end
