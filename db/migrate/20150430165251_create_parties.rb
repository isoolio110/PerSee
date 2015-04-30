class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :size
      t.integer :table_no
      t.string :paid
      t.timestamps
    end
  end
end
