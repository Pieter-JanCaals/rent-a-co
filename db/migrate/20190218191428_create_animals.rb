class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :type
      t.text :description
      t.references :user, foreign_key: true
      t.float :price
      t.string :photo

      t.timestamps
    end
  end
end
