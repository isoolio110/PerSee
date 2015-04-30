class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :course
      t.string :name
      t.string :description
      t.float :price
      t.timestamps
    end
  end
end
