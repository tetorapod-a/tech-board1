class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.datetime :start
      t.datetime :end
      t.string :place
      t.text :place_url
      t.string :client
      t.string :body1
      t.string :body2
      t.string :body3
      t.string :body4
      t.text :detail
      t.date :limit
      # t.references :group, foreign_key: true

      t.timestamps
    end

    add_index :plans, :name
    add_index :plans, :id
  end
end
